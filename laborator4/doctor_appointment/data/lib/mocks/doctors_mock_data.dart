import 'package:data/models/doctor_model.dart';

final List<DoctorModel> doctorsMockData = [
  DoctorModel(
    image:
        "https://s3-alpha-sig.figma.com/img/ab8e/d8d0/b0db1e98ab7f1a31afba13769f282033?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZTsbGVJdxQE1JZEQhq8ZsWLPJ2RhJuyCx6MwJgrEBFnwLdYnN-xqPRCWt~np9CzaWNF46JC-rZmvNz7nOcArJQW0YHj-2~vlpacWW0kQ3h0-Q4-~zZVv0H-SE15VVhNkOk12XHiqs4vVKGxaFq6HD1T6ULALPgk5ZPyBTSvYyBwpbAVomwbaO4jv7wgUq6fZXnOFgopH8oAXhw-5nA98p5leKBC8iMEYWz3ZwPMU40u9rb4tHD1ybj13cKhMyKJ2rCsdBuMOZYnhjrZSNf3yfQgGu16uEOEqVtL9ShJ1rWivbhyqQYBV2-pbg~QSqXoH14IEpENbMv0OcqPfY2qu2w__",
    fullName: "Dr. David Patel",
    typeOfDoctor: "Cardiologist",
    locationOfCenter: "Cardiology Center, USA",
    reviewRate: 5.0,
    reviewsCount: 1872,
  ),
  DoctorModel(
    image:
        "https://s3-alpha-sig.figma.com/img/eda2/ee92/bffb300537aa46caf4c65351a0a20dde?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=oJNp2QLHi9m68bpWpNJUJ6vEyK0WuQVbZxZx4yJtj6Em50yYDZbLaamFxAbbrhAwE6FMIolz5hiAnR1JHrPSaDMxnWEyPe~oZ0KPtJkABaljp84YVwG803dl8q64aMgfmDHL4Xiw0E1D1hl~5ti9e5wQtH-BpWtyk2exKvajELpr0AmH4rJoLw3Rmxh0S9KzNvyzN3rttVea1E948SHG38Y9M3tg6iT8NQLzAMxswgy8OU8SQyC7nUBvGzesBVGqEt2DVoNeJNFIqQYbmygkqR0abhU9NnQ0PXjbiTZtP4~3G5qSDnh~tigU1EggNCb8jAJotgo7AGoV-bDDs~ppbg__",
    fullName: "Dr. Jessica Turner",
    typeOfDoctor: "Gynecologist",
    locationOfCenter: "Women's Clinic, Seattle, USA",
    reviewRate: 4.9,
    reviewsCount: 127,
  ),
  DoctorModel(
    image:
        "https://s3-alpha-sig.figma.com/img/86b5/e652/0800f3ee36c944ded270e36c1763aaed?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=G~603Dpx0t7vYmZ4WiAV1TuoHojM~n6d~dbmpt0ILbnmQVlxQtymgT060Wm9Q5Dj6gV5EMfP5f7r7fQGHeAv8sEIL3ihixezei0PDlg3EgRKJ~EFTAZSAuMMdoY30l1eGTjaMPZGFt0Iftjyi67E8My6dk2qF2tc0-3A6woB9XWJyBTHmTHnaV3xSf2AUDQ-7oJBtjpKP8M-1y9RnMU0UJ3Vi0qnojhfvfDcGqFuxrGImvo4n2D-uF4yR24YtyZy4DTpbhUo6ni0T~U7dCSSPaT9gAQXpB69CjMi0P0riiBsOFnNxz28MMACs61JOPsWzDlmxwXq65NMJdhUFkxWZA__",
    fullName: "Dr. Michael Johnson",
    typeOfDoctor: "Orthopedic Surgery",
    locationOfCenter: "Maple Associates, NY,USA",
    reviewRate: 4.7,
    reviewsCount: 5223,
  ),
  DoctorModel(
    image:
        "https://s3-alpha-sig.figma.com/img/f501/868c/d62449885187cf0eb057a3fdee941589?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=QuiXpuMAOdEllXnhSN8LEkpFzf3xsf9ySX3Eaiui93Pa7HFt11k8WkVKshkkI0eURP6UAnb9V3ieDflGzaukLaEZbuh9a1fF1tFlJyO4oCes-ABprfq4GHvb36x686aJ8ah-~kUoT82MDqiUXcvO07WmEiAfaZY86AJ6hWO1Xg50jH6G9nTmLATlxq0iBZiX2t3p-gsMlBekwt-AbDSZQxMDYTwA7Pvrx2bEiBaoSTG4kYTo13rWNxfeZrIbR8H4l3TmlEPsqmLkyOLmxOgJOODBhgANhUS4TF5Q5HYl9hxK2Y8mRASmN-qgbxnZu3SwKTYWcIDfPHORrGh1uifWIg__",
    fullName: "Dr. Emily Walker",
    typeOfDoctor: "Pediatrics",
    locationOfCenter: "Serenity Pediatrics Clinic",
    reviewRate: 5.0,
    reviewsCount: 405,
  ),
  DoctorModel(
    image:
        "https://s3-alpha-sig.figma.com/img/177e/81a4/cbbe443ae4d16ccaa140e5590a4e0a76?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mmokKXtLt1Vwy~arMTQsLaJ34cNAHR8CN8XIeEAvM6-X~E7aYxXQX8y3kBOXmGd593e5wJ8hh8D9Cg3XT3ZXEA75L7fMQwdLBJ4tWraH94G233RZOU5nSR7vtlF9tpGTutDKwsd3QwzxhVtroBAOBqvn2XYaxVmiCEKcOXa6WX46KsaoQDrYpb-4aklIYmMy0VboMKcjwhrRAgHQavazl0qwqji~OMmbJCz-fXqD2lHJhZIW8S7x1e7YexHjUAOSvxlDa9o9FrJfQkH9WSkCuwdSe0OOfPnbzXupM0VGugIZitn8ucuYYxan2wS85izJda1xzQSm5ckKb5IdFaYmHw__",
    fullName: "Dr. Ana Dark",
    typeOfDoctor: "Gynecologist",
    locationOfCenter: "Serenity Pediatrics Clinic",
    reviewRate: 4.5,
    reviewsCount: 405,
  )
];
