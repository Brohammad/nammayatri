module Components.RideSummaryCard.View where

import Prelude
import PrestoDOM
import Components.RideSummaryCard.Controller
import Effect (Effect)
import Styles.Colors as Color
import Font.Size as FontSize
import Font.Style as FontStyle
import Common.Types.App (LazyCheck(..))
import Language.Strings (getString)
import Language.Types (STR(..))
import Engineering.Helpers.Commons (screenWidth, convertUTCtoISC, getNewIDWithTag)
import Helpers.Utils (fetchImage, FetchImageFrom(..))


view :: Config -> (Action -> Effect Unit) -> forall w . PrestoDOM (Effect Unit) w
view config push = 
  linearLayout
    [ width MATCH_PARENT
    , height WRAP_CONTENT
    , orientation VERTICAL
    , padding $ Padding 16 16 16 16
    , margin $ Margin 16 16 16 16
    , cornerRadius 16.0
    , stroke ("1," <> Color.grey900)
    , gravity CENTER
    
    ]
    [ cabInfoLayout config push
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 1
        , background Color.grey700
        , margin $ Margin 16 12 16 12
        ][]
    , scheduleInfoLayout config push 
    ]


cabInfoLayout :: Config -> (Action -> Effect Unit) -> forall w . PrestoDOM (Effect Unit) w
cabInfoLayout config push = 
  linearLayout
  [ width MATCH_PARENT
  , height WRAP_CONTENT
  , orientation HORIZONTAL
  , layoutGravity "center"
  , padding $ PaddingVertical 2 2
  ]
  [ imageView
      [ width $ V 47
      , height $ V 35
      , imageWithFallback $ config.vehicleServiceTierImageUrl
      , margin $ MarginRight 4 
      ]
  , vehicleInfo config push 
  , linearLayout 
      [ height WRAP_CONTENT
      , width WRAP_CONTENT
      , weight 1.0
      ][]
  , textView $
      [ width WRAP_CONTENT
      , height WRAP_CONTENT
      , text $ config.rideAmount
      , gravity CENTER 
      , color Color.black900
      ] <> FontStyle.body8 TypoGraphy
  ]

scheduleInfoLayout :: Config -> (Action -> Effect Unit) -> forall w . PrestoDOM (Effect Unit) w
scheduleInfoLayout config push = 
  linearLayout
    [ width MATCH_PARENT
    , height WRAP_CONTENT
    , orientation HORIZONTAL
    , gravity CENTER_VERTICAL
    ]
    [ linearLayout
        [ width WRAP_CONTENT
        , height WRAP_CONTENT
        , orientation VERTICAL
        , padding $ PaddingHorizontal 4 4 
        , gravity CENTER_VERTICAL
        ]
        ([ scheduleTiming config.scheduleInfo.pickUpText config.scheduleInfo.pickUpTime config push
        ] <> if config.scheduleInfo.showDropTime then [linearLayout
            [ width WRAP_CONTENT
            , height $ V 5
            ][]
        , scheduleTiming config.scheduleInfo.dropText config.scheduleInfo.dropTime config push
        ] else [])
    , linearLayout 
        [ width WRAP_CONTENT
        , height WRAP_CONTENT
        , weight 1.0
        ][]
    , rideTypePill config push 
    ]

vehicleInfo :: Config -> (Action -> Effect Unit) -> forall w . PrestoDOM (Effect Unit) w
vehicleInfo config push  = 
  linearLayout
    [ height WRAP_CONTENT
    , width WRAP_CONTENT
    , orientation HORIZONTAL
    , cornerRadius 38.0
    , background Color.blue600
    , padding $ Padding 5 5 13 5
    , gravity CENTER
    , layoutGravity "center"
    ]
    [ linearLayout 
    [ height WRAP_CONTENT
    , width WRAP_CONTENT
    , orientation HORIZONTAL
    , cornerRadius 18.0
    , background if config.vehicleInfo.vehicleServiceTierAirConditioned then Color.blue800 else Color.black700
    , padding $ Padding 5 4 5 3
    , gravity CENTER
    , layoutGravity "center"
    ]
    [ imageView
        [ height $ V 14
        , width $ V 14
        , imageWithFallback $ fetchImage FF_COMMON_ASSET $ if config.vehicleInfo.vehicleServiceTierAirConditioned then  "ny_ic_ac_white" else "ny_ic_non_ac_white"
        , layoutGravity "center_vertical"
        , margin $ MarginBottom 1
        ]
    , textView $ 
        [ height WRAP_CONTENT
        , width WRAP_CONTENT
        , text if config.vehicleInfo.vehicleServiceTierAirConditioned then getString AC else getString NON_AC
        , color Color.white900
        , margin $ Margin 3 0 0 1
        , layoutGravity "center_vertical"
        ] <> FontStyle.body1 TypoGraphy
    ]
    , textView $ 
        [ height WRAP_CONTENT
        , width WRAP_CONTENT
        , text config.vehicleInfo.vehicleServiceTierName
        , color Color.black700
        , gravity CENTER
        , layoutGravity "center"
        , margin $ Margin 5 0 0 1
        ] <> FontStyle.body1 TypoGraphy
    , imageView 
        [ width $ V 4
        , height $ V 4
        , imageWithFallback $ fetchImage FF_COMMON_ASSET "ny_ic_inner_fill"
        , margin $ MarginHorizontal 5 0
        ]  
    , linearLayout
    [ height WRAP_CONTENT
    , width $ WRAP_CONTENT
    , orientation HORIZONTAL
    , gravity CENTER
    , margin $ MarginHorizontal 5 5
    ]
    [ imageView
        [ width $ V 14
        , height $ V 14
        , imageWithFallback $ fetchImage FF_COMMON_ASSET "ny_ic_user_filled"
        , layoutGravity "center"
        ]
    , textView $ 
        [ width WRAP_CONTENT
        , height WRAP_CONTENT
        , text (show config.vehicleInfo.vehicleServiceTierSeatingCapacity)
        , color Color.black700
        ] <> FontStyle.body1 TypoGraphy
    ]
    ]

scheduleTiming :: String -> String -> Config -> (Action -> Effect Unit) -> forall w . PrestoDOM (Effect Unit) w
scheduleTiming dateType dateAndTime config push =
  linearLayout
    [ height WRAP_CONTENT
    , width WRAP_CONTENT
    , orientation HORIZONTAL
    , gravity CENTER
    ]
    [ textView $ 
        [ width WRAP_CONTENT 
        , height WRAP_CONTENT
        , text $ dateType <> ": "
        , color Color.black700
        ] <> FontStyle.body1 TypoGraphy
    , linearLayout
        [ width WRAP_CONTENT
        , height WRAP_CONTENT
        , orientation HORIZONTAL
        , gravity CENTER
        ]
        [ textView $
            [ width WRAP_CONTENT
            , height WRAP_CONTENT
            , color Color.black700
            , text $ convertUTCtoISC dateAndTime "DD/MM/YYYY"
            ] <> FontStyle.body1 TypoGraphy
        , imageView 
            [ width $ V 5
            , height $ V 5
            , imageWithFallback $ fetchImage FF_COMMON_ASSET "ny_ic_inner_fill"
            , padding $ PaddingTop 2
            , margin $ MarginHorizontal 4 4
            , gravity CENTER
            ] 
        , textView $ 
            [ width WRAP_CONTENT 
            , height WRAP_CONTENT
            , text $ convertUTCtoISC dateAndTime "hh:mm A"
            , color Color.black700
            ] <> FontStyle.body1 TypoGraphy

        ]
    ]


rideTypePill :: Config -> (Action -> Effect Unit) -> forall w . PrestoDOM (Effect Unit) w
rideTypePill config push = 
  linearLayout
    [ height WRAP_CONTENT
    , width WRAP_CONTENT
    , orientation HORIZONTAL
    , background config.rideTypePill.background
    , padding $ Padding 8 3 8 3
    , cornerRadius 8.0
    ]
    [ imageView
        [ height $ V 16
        , width $ V 16
        , layoutGravity "center_vertical"
        , imageWithFallback $ config.rideTypePill.pillImage
        ]
    , textView $ 
        [ height WRAP_CONTENT
        , text config.rideTypePill.pillText
        , maxWidth $ 55
        , color Color.white900
        , margin $ Margin 4 0 0 1
        , gravity LEFT
        ] <> FontStyle.body6 TypoGraphy
    ]

    