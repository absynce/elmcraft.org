module Theme.Footer exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Helpers exposing (..)
import Html exposing (Html)
import Html.Attributes
import Theme.Layout
import Theme.UI exposing (..)


view model =
    column
        [ Background.color white, width fill, Font.color charcoal ]
        [ column
            [ centerX, width (fill |> maximum Theme.Layout.maxWidth), padding_ 60 30 20 30, spacing 50 ]
            [ none
            , footerNav model
            , row [ width fill ]
                [ row [ alignLeft, width fill ]
                    [ paragraph [ Font.center ]
                        [ text " © elmcraft.org "
                        , link [] { url = "http://creativecommons.org/licenses/by-sa/4.0/", label = image [ width (px 50), moveDown 3 ] { src = "https://licensebuttons.net/l/by-sa/4.0/88x31.png", description = "CC BY-SA Icon" } }
                        ]
                    ]
                , row [ spacing 10, alignRight ]
                    [-- routeLink [] "Terms" (splat_ "placeholder")
                     -- , routeLink [] "Privacy" (splat_ "placeholder")
                     -- externalLink [] "Github" "https://github.com/elmcraft/elmcraft.org"
                    ]
                ]
            ]
        ]


footerNav model =
    let
        item title route =
            routeLink [ centerX ] title route
    in
    rowToColumnWhen 800
        model
        [ width fill, spacing 20 ]
        [ -- footerGroup "Discover"
          --     [ item "Curious" (splat "discover" [ "curious" ])
          --     , item "Beginner" (splat "discover" [ "beginner" ])
          --     , item "Developer" (splat "discover" [ "developer" ])
          --     , item "Manager/CTO" (splat "discover" [ "manager" ])
          --     ]
          -- footerGroup "Build"
          --   [ item "Packages" (splat "build" [ "packages" ])
          --   , item "Tooling" (splat "build" [ "tooling" ])
          --   , item "Design patterns" (splat "build" [ "design-patterns" ])
          --   , item "Examples" (splat "build" [ "examples" ])
          --   , item "Contributing" (splat "build" [ "contributing" ])
          --   ]
          footerGroup "Media"
            [ item "Newsletters" (splat "media" [ "newsletters" ])

            -- , item "Articles" (splat "media" [ "articles" ])
            , item "Podcasts" (splat "media" [ "podcasts" ])
            , item "Videos" (splat "media" [ "videos" ])

            -- , item "Books" (splat "media" [ "books" ])
            ]
        , footerGroup "Community"
            [ item "Forums/Chat" (splat "community" [ "forums-chat" ])
            , item "Meetups" (splat "community" [ "meetups" ])
            , item "Conferences" (splat "community" [ "conferences" ])
            , item "Lore" (splat "lore" [])
            , item "Love" (splat "community" [ "love" ])

            -- , item "FAQs" (splat "faqs" [])
            ]

        -- , footerGroup "Commercial"
        --     [ item "Elm at work" (splat "commercial" [ "elm-at-work" ])
        --     , item "Succcess stories" (splat "commercial" [ "success-stories" ])
        --     , item "Hiring" (splat "commercial" [ "hiring" ])
        --     , item "Jobs" (splat "commercial" [ "jobs" ])
        --     , item "Support" (splat "commercial" [ "support" ])
        --     ]
        , footerGroup "Elmcraft"
            [ item "About" (splat_ "about")
            , item "Discuss" (splat_ "discuss")

            -- , externalLink [] "Github" "https://github.com/elmcraft/elmcraft.org"
            ]
        ]


footerGroup title items =
    column [ alignTop, width fill, spacing 10 ] <|
        [ paragraph [ Font.color charcoal, Font.bold, paddingXY 0 10, Font.center ] [ text title ]
        ]
            ++ items
