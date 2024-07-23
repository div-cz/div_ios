//
//  Movies+MockData.swift
//  Div_iOS_App
//
//  Created by Pavla Beránková on 23.07.2024.
//

import Foundation

struct Movies {
    var movies: [Movie]
}

extension Movies {
    static let mock: Movies = Movies(
        movies: [
            Movie(
                id: 12,
                title: "Hledá se Nemo",
                releaseYear: "2003",
                popularity: 122.376,
                detail: MovieDetail(
                    id: 12,
                    title: "Hledá se Nemo",
                    description: """
    V pestrobarevných a teplých vodách Velké útesové bariéry žije ve svém bezpečném a odlehlém příbytku ze sasanek Marlin a jeho jediný syn Nemo. Marlin se s obavami ze všech nepředvídatelných nebezpečí, které hlubiny oceánu skýtají, snaží svého syna před nástrahami okolí ochránit. Nemo je však, stejně jako všechny malé rybky, velmi zvídavý a chce tajemný útes prozkoumat. Když je pak nečekaně unesen daleko od domova a skončí v akváriu, kterým si vyzdobil ordinaci laciný zubař, ocitne se Marlin nečekaně v roli hrdiny na cestě k záchraně svého syna.
    """,
                    releaseYear: "2003",
                    duration: 100,
                    popularity: 122.376,
                    genres: ["Animation", "Family"],
                    directors: ["Andrew Stanton"],
                    actors: ["Albert Brooks",
                             "Stephen Root",
                             "Allison Janney",
                             "Vicki Lewis",
                             "Erica Beck",
                             "Erik Sullivan",
                             "Nicole Miller",
                             "Ellen DeGeneres",
                             "Elizabeth Perkins",
                             "Andrew Stanton",
                             "John Ratzenberger",
                             "Geoffrey Rush",
                             "Joe Ranft",
                             "Brad Garrett",
                             "Austin Pendleton",
                             "Eric Bana",
                             "Bob Peterson",
                             "Alexander Gould",
                             "Willem Dafoe",
                             "Bruce Spence",
                             "LuLu Ebeling",
                             "Nicholas Bird",
                             "Barry Humphries",
                             "Bill Hunter",
                             "Jordan Ranft",
                             "Carlos Alazraqui",
                             "Vicki Lewis",
                             "Paul Eiding",
                             "Alec Medlock",
                             "Lisa Peers",
                             "Geoff Brooks",
                             "Bob Bergen",
                             "Phil Proctor",
                             "Emmett Shoemaker",
                             "Daryl Sabara",
                             "Leland Grossman",
                             "Oliver Kindred",
                             "Kali Whitehurst",
                             "Ben Stanton",
                             "Danny Mann",
                             "Rove McManus",
                             "James S. Baker",
                             "Annelise Nolting",
                             "Vanessa Marano",
                             "Susan Blu",
                             "Jennifer Darling",
                             "Jeff Pidgeon",
                             "Bob Peterson",
                             "David Salter",
                             "Aaron Fors",
                             "Katherine Ringgold",
                             "Caroline Kindred",
                             "Sherry Lynn",
                             "Jim Ward",
                             "Mickie McGowan",
                             "Jack Angel",
                             "Laura Marano",
                             "Bobby Block",
                             "Laraine Newman",
                             "Jane Carr",
                             "Jessie Flower",
                             "Jan Rabson",
                             "Bradley Trevor Greive",
                             "Evan Sabara",
                             "Marc Jefferies",
                             "Eliza Schneider",
                             "Lee Unkrich",
                             "Noah Luke",
                             "Lili Ishida",
                             "Jess Harnell"
                            ],
                    imgPoster: "/qALyA3wnq2MExpkJ4ubxyTfTUSz.jpg"
                )
            ),
            Movie(
                id: 11,
                title: "Hvězdné války",
                releaseYear: "1977",
                popularity: 126.488,
                detail: MovieDetail(
                    id: 11,
                    title: "Hvězdné války",
                    description: """
    Rytíři Jedi byli vyhlazeni a Impérium vládne galaxii pevnou rukou. Malá skupina povstalců se odváží vzdorovat a ukradne plány k nejmocnější zbrani Impéria, Hvězdě smrti. Imperátorův nejvěrnější služebník, Darth Vader, musí najít plány a skrytou základnu povstalců. Zpráva o princezně Leie a vůdci rebelů se dostane až k obyčejnému farmáři, Lukovi Skywalkerovi. Ten se řídí svým osudem, zachraňuje princeznu a pomáhá povstalcům svrhnout Impérium společně s takovými nezapomenutelnými spojenci jako: Obi-Wan Kenobi, domýšlivý Han Solo, loajální Chewbacca a droidové R2-D2 a C3PO.
    """,
                    releaseYear: "1977",
                    duration: 121,
                    popularity: 126.488,
                    genres: ["Adventure", "Action", "Science Fiction"],
                    directors: ["George Lucas"],
                    actors: [
                        "Harrison Ford",
                        "Alec Guinness",
                        "Jeremy Sinden",
                        "David Prowse",
                        "Mark Hamill",
                        "Peter Cushing",
                        "William Hootkins",
                        "Angus MacInnes",
                        "Richard LeParmentier",
                        "Don Henderson",
                        "Phil Brown",
                        "David Ankrum",
                        "Graham Ashley",
                        "Carrie Fisher",
                        "Scott Beach",
                        "Peter Mayhew",
                        "Jack Klaff",
                        "Jack Purvis",
                        "Kenny Baker",
                        "Anthony Daniels",
                        "Leslie Schofield",
                        "Drewe Henley",
                        "Shelagh Fraser",
                        "Denis Lawson",
                        "Eddie Byrne",
                        "Alex McCrindle",
                        "Garrick Hagon",
                        "Lightning Bear",
                        "James Jones",
                        "Jon Berg",
                        "Ted Burnett",
                        "Janice Burchette",
                        "Paul Blake",
                        "Michael Leader",
                        "John Chapman",
                        "Sadie Eden",
                        "Gilda Cohen",
                        "Robert A. Denham",
                        "Barry Gnome",
                        "Alfie Curtis",
                        "Barry Copping",
                        "Kim Falkinburg",
                        "Warwick Diamond",
                        "Steve Gawley",
                        "Alan Harris",
                        "Doug Beswick",
                        "Ted Gagliano",
                        "Maria Aragon",
                        "Tim Condren",
                        "Robert Davies",
                        "Tommy Ilsley",
                        "Linda Jones",
                        "Annette Jones",
                        "Frazer Diamond",
                        "Rusty Goffe",
                        "Harry Fielder",
                        "Joe Kaye",
                        "Al Lampert",
                        "Laine Liska",
                        "Anthony Lang",
                        "Mandy Morton",
                        "Derek Lyons",
                        "Alf Mangan",
                        "Salo Gardner",
                        "Peter Diamond",
                        "Grant McCune",
                        "Joe Johnston",
                        "Tiffany Hillkurtz",
                        "Lorne Peterson",
                        "Shane Rimmer",
                        "Marcus Powell",
                        "Erica Simmons",
                        "Pam Rose",
                        "Angela Staines",
                        "George Roubicek",
                        "Melissa Kurtz",
                        "Peter Sumner",
                        "Reg Harding",
                        "Isaac Grand",
                        "Peter Sturgeon",
                        "John Sylla",
                        "Tom Sylla",
                        "Phil Tippett",
                        "Malcolm Tierney",
                        "Burnell Tucker",
                        "Diana Sadley Way",
                        "Colin Higgins",
                        "Mahjoub Mahjoub",
                        "Frank Henson",
                        "Geoffrey Moon",
                        "Anthony Forrest",
                        "Frances Alfred Basil Tomlin",
                        "Ron Tarr",
                        "Larry Ward",
                        "Scott Schumann",
                        "Laine Liska",
                        "Derek Lyons",
                        "Hal Wamsley",
                        "Roy Straite",
                        "Peter Diamond",
                        "Arthur Howell",
                        "Tom Sylla",
                        "Rusty Goffe",
                        "George Stock",
                        "Colin Michael Kitchens",
                        "Anthony Forrest",
                        "Peter Diamond",
                        "Jerry Walter",
                        "Fred Wood",
                        "Rusty Goffe",
                        "Morgan Upton",
                        "Peter Diamond",
                        "Bill Weston",
                        "John Cannon"
                    ],
                    imgPoster: "/qqrBr0uQ6oa5K23WZgySBgFbj8l.jpg"
                )
            )
        ]
    )
}
