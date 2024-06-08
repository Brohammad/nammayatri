{-
 
  Copyright 2022-23, Juspay India Pvt Ltd
 
  This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License
 
  as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program
 
  is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of
 
  the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
-}

module Screens.RateCardScreen.Controller where

import Screens.Types (RateCardScreenState)
import Prelude
import PrestoDOM (Eval, update, continue, continueWithCmd, exit, updateAndExit)
import PrestoDOM.Types.Core (class Loggable)
import Log (printLog, trackAppActionClick, trackAppBackPress, trackAppEndScreen, trackAppScreenEvent, trackAppScreenRender, trackAppTextInput)
import Screens (ScreenName(..), getScreen)
import Components.PrimaryButton as PrimaryButton
import Components.RateCard as RateCard
import Common.Types.App as CTA
import Data.Array ((!!))
import Data.Maybe (Maybe(..))
import JBridge as JB
import Engineering.Helpers.Commons as EHC

data ScreenOutput = Back RateCardScreenState

data Action = BackClick
    | ShowRateCard Int
    | PrimaryButtonAC PrimaryButton.Action
    | SliderCallback Int
    | AfterRender
    | RateCardAction RateCard.Action
    | ChangeSlider Boolean
    | OpenLink String

instance showAction :: Show Action where
    show _ = ""

instance loggableAction :: Loggable Action where
    performLog action appId = case action of
      AfterRender -> trackAppScreenRender appId "screen" (getScreen RATE_CARD_SCREEN)
      BackClick -> do
        trackAppBackPress appId (getScreen RATE_CARD_SCREEN)
        trackAppEndScreen appId (getScreen RATE_CARD_SCREEN)
      ShowRateCard index -> trackAppActionClick appId (getScreen RATE_CARD_SCREEN) "in_screen" "rate_card"
      OpenLink link -> trackAppActionClick appId (getScreen RATE_CARD_SCREEN) "in_screen" "open_link"
      SliderCallback val -> trackAppActionClick appId (getScreen RATE_CARD_SCREEN) "in_screen" "slider"
      RateCardAction action ->
        case action of
          RateCard.Close -> trackAppActionClick appId (getScreen RATE_CARD_SCREEN) "in_screen" "close"
          RateCard.BackPressed -> trackAppActionClick appId (getScreen RATE_CARD_SCREEN) "in_screen" "back"
          RateCard.GoToDefaultStart -> trackAppActionClick appId (getScreen RATE_CARD_SCREEN) "in_screen" "default_start"
          RateCard.GoToDriverAddition -> trackAppActionClick appId (getScreen RATE_CARD_SCREEN) "in_screen" "driver_addition"
          RateCard.GoToTollOrParkingCharges -> trackAppActionClick appId (getScreen RATE_CARD_SCREEN) "in_screen" "toll_parking"
          _ -> pure unit
      PrimaryButtonAC action -> 
        case action of
          PrimaryButton.OnClick -> trackAppActionClick appId (getScreen RATE_CARD_SCREEN) "primary_button_action" "open_google_maps"
          _ -> pure unit
      ChangeSlider increment -> trackAppActionClick appId (getScreen RATE_CARD_SCREEN) "in_screen" "slider"
      


eval :: Action -> RateCardScreenState -> Eval Action ScreenOutput RateCardScreenState

eval BackClick state = exit $ Back state

eval (PrimaryButtonAC PrimaryButton.OnClick) state = continueWithCmd state [ pure $ BackClick ]

eval (SliderCallback val) state = continue state { props { sliderVal = val}}

eval (ChangeSlider increment) state = continueWithCmd state [do 
    let val = if increment then state.props.sliderVal + state.props.incrementUnit else state.props.sliderVal - state.props.incrementUnit
        isSliderValueValid = val <= state.props.sliderMaxValue && val >= state.props.sliderMinValue
    if isSliderValueValid then do 
      void $ JB.updateSliderValue {sliderValue : val, id : EHC.getNewIDWithTag "RateSlider"}
      pure $ SliderCallback val
      else pure $ AfterRender
    ]

eval (RateCardAction RateCard.Close) state = continue state { props { showRateCard = false } , data{rateCard{onFirstPage = false,currentRateCardType = CTA.DefaultRateCard}}}

eval (RateCardAction RateCard.BackPressed) state = continue state { props { showRateCard = false } ,data{rateCard{onFirstPage = false,currentRateCardType = CTA.DefaultRateCard}}}

eval (RateCardAction RateCard.GoToDefaultStart) state = continue state { data{rateCard{currentRateCardType = CTA.DefaultRateCard}}}

eval (RateCardAction RateCard.GoToDriverAddition) state = continue state { data{rateCard{currentRateCardType = CTA.DriverAddition,onFirstPage = true}}}

eval (RateCardAction RateCard.GoToTollOrParkingCharges) state = continue state { data{rateCard{currentRateCardType = CTA.TollOrParkingCharges,onFirstPage = true}}}

eval (ShowRateCard index) state = case state.data.ridePreferences !! index of
  Just ridePreference -> do
    case ridePreference.rateCardData of
      Just rateCardData -> 
        continue state { data { rateCard  {
            onFirstPage = false,
            serviceTierName = Just ridePreference.name,
            currentRateCardType = CTA.DefaultRateCard,
            driverAdditions = rateCardData.driverAdditions,
            fareInfoDescription = rateCardData.fareInfo,
            isNightShift = rateCardData.isNightShift,
            nightChargeTill = rateCardData.nightChargeEnd,
            nightChargeFrom = rateCardData.nightChargeStart,
            extraFare = rateCardData.fareList
          }} , props {showRateCard = true } }
      Nothing -> continue state
  Nothing -> continue state

eval (OpenLink link) state = continueWithCmd state [ do 
  void $ JB.openUrlInApp link
  pure AfterRender
  ]

eval _ state = update state