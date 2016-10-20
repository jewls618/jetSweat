require 'webmock/rspec'
require 'vcr'

WebMock.disable_net_connect!(allow_localhost: true)

json = '{
"html_attributions": [],
"results": [
{
"formatted_address": "133 Federal St, Boston, MA 02110, United States",
"geometry": {
"location": {
"lat": 42.3542645,
"lng": -71.05652909999999
},
"viewport": {
"northeast": {
"lat": 42.35429764999999,
"lng": -71.05618829999999
},
"southwest": {
"lat": 42.35425345,
"lng": -71.0566427
}
}
},
"icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
"id": "c26c2300c006b8b12e27e437842c021c04d06ba3",
"name": "BRICK CrossFit DTX / BRICK Boston",
"opening_hours": {
"open_now": true,
"weekday_text": []
},
"photos": [
{
"height": 696,
"html_attributions": [
"<a href=\"https://maps.google.com/maps/contrib/109648668637323779936/photos\">BRICK CrossFit DTX / BRICK Boston</a>"
],
"photo_reference": "CoQBcwAAAF4TQ92eWHb5OoD--MBXKi_02TGFkN66gvhlviWwLEoN3RMjXhLCkl-LKS-Hzm9fNZ3yB75YaoWefTyIJeOuSaY1L7paJMq4pImaK_G34iXeReD_NZENcL4zW_tfcCWYzh1zFLqj3xg13wUG49NOZLxwCoRzZAuouxanWY-CNmRdEhDdLy7vxSgB5auCQ2ZjvICHGhSgfwtINpNHTzkaNOwotwmxz4j2lQ",
"width": 1108
}
],
"place_id": "ChIJ0ZqJMoJw44kRLbaugarhzOc",
"rating": 5,
"reference": "CmRSAAAAiUnJlsqDwFX5IvRgt7D23cJ0O4x6_3zFXzCAmO65YbODGvHqtW6Q2rziG9YVn5WKE3aRe23i1DgvoUcb9eg0JMWDwoFvFC9rwFAGbM3ViUwCFyROxY4Yxt1r53xWW785EhAkE-bfuQEI5cXGlBy5Y_JYGhQpvDzG5NnNqH5hkDSyX_KRVp3vlQ",
"types": [
"gym",
"health",
"point_of_interest",
"establishment"
]
},
{
"formatted_address": "31 St James Ave, Boston, MA 02116, United States",
"geometry": {
"location": {
"lat": 42.35095250000001,
"lng": -71.0715658
},
"viewport": {
"northeast": {
"lat": 42.35106860000001,
"lng": -71.07152900000003
},
"southwest": {
"lat": 42.35060420000001,
"lng": -71.07167619999998
}
}
},
"icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
"id": "a93cce662fa7ac2bb8be928bb1d4861a846233bd",
"name": "Reebok CrossFit Back Bay - Back Bay Location",
"opening_hours": {
"open_now": true,
"weekday_text": []
},
"photos": [
{
"height": 1613,
"html_attributions": [
"<a href=\"https://maps.google.com/maps/contrib/108003330150441415227/photos\">Reebok CrossFit Back Bay - Back Bay Location</a>"
],
"photo_reference": "CoQBdwAAAAiU5Wgv_H8KXazDHi7Fwbs2F5zgzE2BosB65mrnja5oq4tw03zzwYVcyD7J2XVucznxfr91m7X73b1xo_-Jy5Mke7abWBCgeBtTRAvdVFqCE0QdOUhdmf1HLL1DBkm79GVZtpDCOi6ZYFUg9Bvdzf53yIACfDW2MAgegFYZl8RmEhDmT7ZA-3rWyfh-RykJpRkSGhREScXzAvxFk1DY0YVbEBZ3p-TkmQ",
"width": 2000
}
],
"place_id": "ChIJ05lekXR644kR0-FHVHlfGqg",
"rating": 4.4,
"reference": "CmRSAAAAHje_CTL3CPrENXcr5MakwUi_hx_9d9uZBxcU_x3ZQIA8dqQHP8ecI7St9P0ycP5Rz7ii6ynjCdeD09X5gsAu1miRFmufrY_4sEUd8O_rWGwsxfMmfYDPsKtJOsy7Zr4sEhDxWpLzYRR95HCpcOWRWRI-GhSukowbVkqMS2Qv1C7jG83eTapIYQ",
"types": [
"gym",
"physiotherapist",
"health",
"point_of_interest",
"establishment"
]
},
{
"formatted_address": "385 Dorchester Ave #100, Boston, MA 02127, United States",
"geometry": {
"location": {
"lat": 42.334644,
"lng": -71.057982
},
"viewport": {
"northeast": {
"lat": 42.33465944999999,
"lng": -71.05656975
},
"southwest": {
"lat": 42.33463885,
"lng": -71.05845274999999
}
}
},
"icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
"id": "19a3f96060f43d9623d2f4020e1365860806e054",
"name": "Crossfit Southie",
"opening_hours": {
"open_now": true,
"weekday_text": []
},
"photos": [
{
"height": 640,
"html_attributions": [
"<a href=\"https://maps.google.com/maps/contrib/100802467595210815770/photos\">Crossfit Southie</a>"
],
"photo_reference": "CoQBcwAAAEM589sb0vp9pvmfo3lKCHSi8R1ztz8-JEVrbQx8U_IUXvmr9eZ9NXsZQ6ILESgLJ1yvAkU2zteN_CSv8rutYh79sMXE2TjlUitmdvR92arYUXVVUX_xHnExU1bYI4_jGE6zOZ6a96KpaDwhzPjwT8OFSsCxPEQqPtUKgfgAvcEDEhCpaEewpGU3HCsQBvFoCV48GhSG0Pb3hUzbYYBx-XNMYYWQqkdveg",
"width": 640
}
],
"place_id": "ChIJxX6PDWd644kR3jFIUDqgMtQ",
"rating": 4.8,
"reference": "CmRSAAAAuovo15LfytuKul0rZtWBoglGRmBHJF12KneQhYGhdh7505IbvQXCFS8WQOjKm5o_Kxa_Y2ACVfSgVk3vQrVCZpUZwCcx6VmPHxq9ZM7oyAea4AMfKd9quh9ivDPMmF8OEhBvMJSQq5b7RHM_kNpZJnW6GhTjdXmgemU6UxT7FqEMFX4dQGaeVA",
"types": [
"gym",
"health",
"point_of_interest",
"establishment"
]
},
{
"formatted_address": "100 Brookline Ave, Boston, MA 02215, United States",
"geometry": {
"location": {
"lat": 42.3461432,
"lng": -71.0994951
},
"viewport": {
"northeast": {
"lat": 42.34618374999999,
"lng": -71.09942180000002
},
"southwest": {
"lat": 42.34610515,
"lng": -71.099715
}
}
},
"icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
"id": "2ea8933112db093b496772c6d7e712ab842e6311",
"name": "CrossFit Fenway",
"opening_hours": {
"open_now": true,
"weekday_text": []
},
"place_id": "ChIJSw7FxfV544kRedruTET0Sfc",
"reference": "CmRSAAAAdldmE7jTH9kERQjXUUBam91qnDCkrK5dIc3VNIjoItMugQJh-XWaC_z8ISXvnoyflyn8jWO9bRjooMsS0233BYdEmvTB8FPyV23uXA7MpuuS8_pwBjAH9CltgFpU74rAEhAmkZn2iF1LI9xjFDlfVSlnGhQaNp5APZsYktj-kAOT9B2AnxoSLw",
"types": [
"gym",
"health",
"point_of_interest",
"establishment"
]
},
{
"formatted_address": "209 Columbus Ave, Boston, MA 02116, United States",
"geometry": {
"location": {
"lat": 42.34847810000001,
"lng": -71.0724066
},
"viewport": {
"northeast": {
"lat": 42.34854199999999,
"lng": -71.0719197
},
"southwest": {
"lat": 42.34845680000002,
"lng": -71.0725689
}
}
},
"icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
"id": "b6c2de5ad746463201a2e9105333ffca14a9d461",
"name": "Reebok CrossFit Back Bay - South End Location",
"opening_hours": {
"open_now": true,
"weekday_text": []
},
"photos": [
{
"height": 609,
"html_attributions": [
"<a href=\"https://maps.google.com/maps/contrib/111989949851730231546/photos\">Reebok CrossFit Back Bay - South End Location</a>"
],
"photo_reference": "CoQBdwAAAGX5fA2eQp6cJw_IkWAGKV2BWZ4mK3CrKKj_z6xthAev--w-mORld27MaCjKLQ2bv3yBwekTbntJ1OKsbFLXWRsgBpw96BJAHHRloEe1E6UsSiEcKBRJmCwvZAE6tnIDK7byzqOn5TNJpZVKJAo6DGsomSuUYY-_eEFo_IuoXaEiEhCm2XRsxQlApGlaPqpyNdyTGhT5fZ4xJ4L7qOP96i_RRs141vkNaw",
"width": 813
}
],
"place_id": "ChIJDxSIPnN644kRU0YmvN9fivc",
"reference": "CmRSAAAA9kSKLJ0XLd8YJj3DcnkzqMNGLr2lQq6r7CrgiPguXZpRs1YP8sloPbBNTAIovy4dBneUCZTrxpDE6otmbzMn1V0B0EwVGwSgskS004TWA31N7WeWKh2WlfgAjw2744G_EhB9ZzwwD3u26kyXrjvxg03RGhQUVd6mAakJD3cshRnCh1JnC07b-A",
"types": [
"gym",
"physiotherapist",
"health",
"point_of_interest",
"establishment"
]
},
{
"formatted_address": "1 Everett St, Boston, MA 02128, United States",
"geometry": {
"location": {
"lat": 42.3684811,
"lng": -71.0374583
},
"viewport": {
"northeast": {
"lat": 42.36873099999999,
"lng": -71.03720494999999
},
"southwest": {
"lat": 42.36839779999999,
"lng": -71.03754275
}
}
},
"icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
"id": "e1d512bd4ad2d72f58578e912419a44887ed523b",
"name": "CrossFit Jeffries Point",
"opening_hours": {
"open_now": false,
"weekday_text": []
},
"photos": [
{
"height": 1536,
"html_attributions": [
"<a href=\"https://maps.google.com/maps/contrib/110052343218003039401/photos\">CrossFit Jeffries Point</a>"
],
"photo_reference": "CoQBcwAAAGUGrQ2k7GnxWlpK_DIvgoZC5JqDLDQD96xFvgrZA9mxvERmDfiBPUwmEVdZV9TA1KhUithn54e1rNtv14yEW7sOniVYlx61gwcFcLiNzckojiDroWcs7SzuZxKoM2TKTnuhamod5Gjq_B9lYGFMcW_k-WaKAqIReEX7U8tec7mpEhBM98uJZXPpfktxPVXV2ZPgGhSsMM9Ee4ZExKVCJhFJskmv-42ulA",
"width": 2048
}
],
"place_id": "ChIJ-XaUsUJw44kR6kSlDywvbuw",
"reference": "CmRSAAAA5fvZXgssQzFv2alRtIykHLSK88mmbXhwLrRVvMlQwiPNuK9lrYSqckWFttrWNFonolh_reVbKtGvVV6Z7KcobaY6cFZNYpPSC-LML-nFcpA-yV378GSJk0hSvWmv1aPKEhCgt0Cx2vWHG7RRApxYrGD5GhSU4bhPUUdpik9LpP1HjzlSxtGm5Q",
"types": [
"gym",
"health",
"point_of_interest",
"establishment"
]
},
{
"formatted_address": "1230 VFW Pkwy, West Roxbury, MA 02132, United States",
"geometry": {
"location": {
"lat": 42.27805689999999,
"lng": -71.1695056
},
"viewport": {
"northeast": {
"lat": 42.27864115000001,
"lng": -71.16848365
},
"southwest": {
"lat": 42.27786214999998,
"lng": -71.17257145
}
}
},
"icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
"id": "fcff65000a622875bb6e0287581e9134a8e761d5",
"name": "CrossFit Boston Iron & Grit",
"opening_hours": {
"open_now": true,
"weekday_text": []
},
"photos": [
{
"height": 607,
"html_attributions": [
"<a href=\"https://maps.google.com/maps/contrib/100038451624574946066/photos\">CrossFit Boston Iron &amp; Grit</a>"
],
"photo_reference": "CoQBcwAAAGr0RKtt9b-s1fLgnsG1OaVzVYW4FSuv-Uw9gy7X2yIquQjsNbITfVSeJ5moXZs2PkN0URNG8hRfCNJYpsiqUltVGEDIBiBQwRmyJdCO441tyFFOjb9XhKnEO1_ZPllI3aJv56jDbopGazKcv8dSXywldre9cx7d09rrBewElpMIEhD3jo1mFLTN-9_B5AjwIU3jGhS446aG49BHPQjPT6fo2ICKMzdK2g",
"width": 1024
}
],
"place_id": "ChIJEZKtZUB_44kRQpcQazaf7Sk",
"reference": "CmRRAAAAZz9TWPwhCDIzgJG_Hjikubl_ZDBsdazmvKQ2UuWxR5TYomFG5374qNO99DOcnmB5mrLSzw_SzIi4Z8O3Dd7Rceane_bzPA6XzobvFOrXyWAaISI0AcUb_O-yNigvc-uKEhDGFPl-YVlNT1P7c8eJxB_uGhTQcSHlvMQc21Irxls5p3Dux4OELg",
"types": [
"health",
"point_of_interest",
"establishment"
]
},
{
"formatted_address": "123 Terrace St, Roxbury Crossing, MA 02120, United States",
"geometry": {
"location": {
"lat": 42.32821829999999,
"lng": -71.09846209999999
},
"viewport": {
"northeast": {
"lat": 42.32826615,
"lng": -71.09818145
},
"southwest": {
"lat": 42.32820234999998,
"lng": -71.09855564999998
}
}
},
"icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
"id": "eabde14a7438f97098632802b3a9e2fbd4cab78a",
"name": "CrossFit on the Hill",
"opening_hours": {
"open_now": true,
"weekday_text": []
},
"photos": [
{
"height": 2048,
"html_attributions": [
"<a href=\"https://maps.google.com/maps/contrib/104748018559256726756/photos\">CrossFit on the Hill</a>"
],
"photo_reference": "CoQBcwAAAFOBizY2luyL8wpIc7nyMMRY0W9TKUqVrBSfHOAhnGzhJ0CDu78gO13r5q9gmos8L002liG4EUaAV5yIl3vKKLIXJLYBe4rM02NuKo0_HT1MmyVX36bTSGM23zJdx_FdlZZgPMKJlzfnGxtrk8sWQ_-2qQq04EwiyPICacpt5c5IEhB1K0vsbo4NNBK6AR_Le5SzGhR8z3SVnGhpQ0ZPg9cuivey8C97Hw",
"width": 1536
}
],
"place_id": "ChIJeQ9fcYd544kRQCHABnhyZ34",
"rating": 4.7,
"reference": "CmRRAAAAaQjhNRFgP_r8iQL2toqO1gjQtuE8s7v5ncl-ppgWzk0HBrHN2XXo-t-XV0MbYcUqMNpesszZkOZl12O-9mAs0uXeOkPLTLPOdJ7iQDqjV_-JKfTz1eS_lP-Kk0XtQS66EhDylbrJIAjDiuDrgZGy21L7GhRyZDNS5ck0ucmXRziSY7rvAxkh_g",
"types": [
"gym",
"health",
"point_of_interest",
"establishment"
]
},
{
"formatted_address": "Rear, 100 Holton St, Brighton, MA 02135, United States",
"geometry": {
"location": {
"lat": 42.359625,
"lng": -71.137862
},
"viewport": {
"northeast": {
"lat": 42.35985935,
"lng": -71.1377723
},
"southwest": {
"lat": 42.35892195,
"lng": -71.1381311
}
}
},
"icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
"id": "1162e45f187c09303c08df6df21ded9d5b86853c",
"name": "Our Crew Fitness",
"opening_hours": {
"open_now": true,
"weekday_text": []
},
"photos": [
{
"height": 1536,
"html_attributions": [
"<a href=\"https://maps.google.com/maps/contrib/104261253037849502753/photos\">Our Crew Fitness</a>"
],
"photo_reference": "CoQBdwAAALreUp12e6n7zkEGFZorYGXg6-QNLTayN15MGic_lSKOCVZTleQKwQGz-068oivfYYP06U0Yjcys7z9LtMCncupfZSLhncWZQjN3Zhh7tiafwi3MyC2la5FOs6UcRyWifFP2AH1A4vIj5mVkVIkspCYhsnvnt4_KkbBiZZLRh-IiEhDUKApac2Q2mK7cLg3DMBB4GhQhHFq9q3Em_42dUWpXLO6_CK5kGw",
"width": 1541
}
],
"place_id": "ChIJLWGEfd9544kR2vlW9xVyUjI",
"rating": 4.6,
"reference": "CmRRAAAAvCUxPTcSoTts7wfojNQiJPDK0xeymdrw--3vR_haESjoUXAE1JuqtwD_1PjB-M7mD1Wg1CDJjLNaofUv4JiYuTJykVl8m8pspXvBtpbLHsrIMawj7LbKhGlFWFNbXrIKEhAqVofKdk1wkDNlFhw9cSbaGhR1749CBWNx9eHneOBvYSQObtf5vg",
"types": [
"gym",
"health",
"point_of_interest",
"establishment"
]
},
{
"formatted_address": "133 Federal St, Boston, MA 02110, United States",
"geometry": {
"location": {
"lat": 42.35426759999999,
"lng": -71.0566099
},
"viewport": {
"northeast": {
"lat": 42.3543273,
"lng": -71.05615345
},
"southwest": {
"lat": 42.35424769999999,
"lng": -71.05676205
}
}
},
"icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
"id": "1cf8b829fb891ffc3a5c58954188dc87445c482b",
"name": "CrossFit The Taj",
"permanently_closed": true,
"photos": [
{
"height": 1371,
"html_attributions": [
"<a href=\"https://maps.google.com/maps/contrib/105527900381382250254/photos\">CrossFit The Taj</a>"
],
"photo_reference": "CoQBcwAAAKyUPN_CHJkJUngspge7ptFN5m2QtvpYnbauuY4aya4z_TT9zxOF7qFABU0fsHstn-Ydmbj_qGHzvnTTi75cbUFLqoiCayciZiDEVmLMSiQtcSMSIIAOMcVXxwsQ2rgipXZYYvCqX5fU9tlRD4BSdOaeBo71RU6P2fKQPyDTiq-TEhCNGFZqrBcUMpYXdpi41aUWGhRebkBTmcdsJIN6rQIfqwaB2Flhew",
"width": 2048
}
],
"place_id": "ChIJpUVALYJw44kRUZ8atqrT5Go",
"reference": "CmRRAAAAm4tV8XYAD71Zq68N857-uJnjJgARrVfarDGvwsigJz5Fs2CoZwCLHT-rKFD5GxJCxDqPggE1DO31k6Ed-QVHwzZeAxnAHKA00__QdiuXyuZBs9ct1ddKDaNqNJyyCsMFEhCgQbfEGMmSmfUySEvAtzjjGhTAuQbAMal28b1z8T8PurVxFFTqWA",
"types": [
"health",
"point_of_interest",
"establishment"
]
},
{
"formatted_address": "8 Rugg Rd, Boston, MA 02134, United States",
"geometry": {
"location": {
"lat": 42.35493299999999,
"lng": -71.13558379999999
},
"viewport": {
"northeast": {
"lat": 42.35497045,
"lng": -71.13528695000002
},
"southwest": {
"lat": 42.35490985000001,
"lng": -71.13568274999999
}
}
},
"icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
"id": "e82dd64eb5ede119f8165be7e43f3f18ebb371ca",
"name": "Rugged CrossFit",
"permanently_closed": true,
"photos": [
{
"height": 1536,
"html_attributions": [
"<a href=\"https://maps.google.com/maps/contrib/107265610081572904203/photos\">Rugged CrossFit</a>"
],
"photo_reference": "CoQBcwAAAFcSX43ihHo6FCrPLFIeL8ZRAIE2Y7xg6Vbuq_2BEPJAT6Tyha7G95vysyhGad-wRhaEvuPXqu5JLovnWYBA2GCPRWXgEpHgXoNUsGY_1YuYKqx3dwxEuoW6Ww4DovOhu2njqJLSG8OprsLa7zwHFx2MDrGyEMHhsof5M-Y-cycdEhBltkR3F7XKR26HjSWIDqnhGhR_HhGmOYhjm26nSTxO1var5xHydQ",
"width": 1536
}
],
"place_id": "ChIJDccNyc9544kR_ecGfs8gbXs",
"reference": "CmRRAAAABlkaloXa6Du3RN50s8zjx9lat6LG4VeYbgk76097PUum8lhT7zKiYwjMsEdvQvsCDNULP52WpMf6LbTZ_qH7cx_-6xEHGalybO4wEjrJlNdExkwrJU8R9Irn8rqVIRpOEhCXwWAqRbHNt0-uc53hkLWnGhTzOrfb1ZcVETQdcDU-OPlf2rRu9g",
"types": [
"gym",
"health",
"point_of_interest",
"establishment"
]
}
],
"status": "OK"
}'

yelp = '{
    "region": {
        "span": {
            "latitude_delta": 0.0,
            "longitude_delta": 0.0
        },
        "center": {
            "latitude": 41.9522859,
            "longitude": -87.6496544
        }
    },
    "total": 2,
    "businesses": [
        {
            "is_claimed": true,
            "rating": 5.0,
            "mobile_url": "https://m.yelp.com/biz/crossfit-defined-chicago-2?adjust_creative=a8eChXJ8ylH-G2KilwZhEA&utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=a8eChXJ8ylH-G2KilwZhEA",
            "rating_img_url": "https://s3-media1.fl.yelpcdn.com/assets/2/www/img/f1def11e4e79/ico/stars/v1/stars_5.png",
            "review_count": 31,
            "name": "CrossFit Defined",
            "rating_img_url_small": "https://s3-media1.fl.yelpcdn.com/assets/2/www/img/c7623205d5cd/ico/stars/v1/stars_small_5.png",
            "url": "https://www.yelp.com/biz/crossfit-defined-chicago-2?adjust_creative=a8eChXJ8ylH-G2KilwZhEA&utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=a8eChXJ8ylH-G2KilwZhEA",
            "categories": [
                [
                    "Trainers",
                    "healthtrainers"
                ],
                [
                    "Gyms",
                    "gyms"
                ],
                [
                    "Boot Camps",
                    "bootcamps"
                ]
            ],
            "phone": "7736802331",
            "snippet_text": "I\'m from Chicago but live in Los Angeles.  I was back working in Chicago for the summer, and CFD was my home away from home.  I tested out every box in the...",
            "image_url": "https://s3-media2.fl.yelpcdn.com/bphoto/xNFpn9YTTql_7YbDsW_fWA/ms.jpg",
            "snippet_image_url": "https://s3-media2.fl.yelpcdn.com/assets/srv0/yelp_styleguide/189f2ca1fe8c/assets/img/default_avatars/user_medium_square.png",
            "display_phone": "+1-773-680-2331",
            "rating_img_url_large": "https://s3-media3.fl.yelpcdn.com/assets/2/www/img/22affc4e6c38/ico/stars/v1/stars_large_5.png",
            "id": "crossfit-defined-chicago-2",
            "is_closed": false,
            "location": {
                "cross_streets": "Sheridan Rd & Grace St",
                "city": "Chicago",
                "display_address": [
                    "3834 N Broadway Ave",
                    "Lakeview",
                    "Chicago, IL 60613"
                ],
                "geo_accuracy": 9.5,
                "neighborhoods": [
                    "Lakeview"
                ],
                "postal_code": "60613",
                "country_code": "US",
                "address": [
                    "3834 N Broadway Ave"
                ],
                "coordinate": {
                    "latitude": 41.9522859,
                    "longitude": -87.6496544
                },
                "state_code": "IL"
            }
        }
    ]
}'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    stub_request(:get, /maps.googleapis.com/).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: json, headers: {})
  end

  config.before(:each) do
    stub_request(:get, "https://api.yelp.com/v2/").
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: yelp, headers: {})
  end

  def user_signs_in(user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end
