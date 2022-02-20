Config = {}

Config.Job = 'tuner'

Config.Blip = {
    ["blip"] = vector3(824.68, -961.82, 26.11),
}

Config.TunerCrafting = {
    ['location'] = vector3(810.45, -959.34, 26.11), 
    ["items"] = {
        [1] = {
            name = "engine1",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 140,
                ["steel"] = 250,
                ["iron"] = 140,
            },
            type = "item",
            slot = 1,
            threshold = 0,
            points = 1,
        },
        [2] = {
            name = "engine2",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 160,
                ["steel"] = 250,
                ["iron"] = 140,
            },
            type = "item",
            slot = 2,
            threshold = 0,
            points = 1,
        },
        [3] = {
            name = "engine3",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 180,
                ["steel"] = 250,
                ["iron"] = 160,
            },
            type = "item",
            slot = 3,
            threshold = 0,
            points = 1,
        },
        [4] = {
            name = "engine4",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 230,
                ["steel"] = 270,
                ["iron"] = 200,
            },
            type = "item",
            slot = 4,
            threshold = 0,
            points = 1,
        },
        [5] = {
            name = "brake1",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 150,
                ["steel"] = 150,
            },
            type = "item",
            slot = 5,
            threshold = 0,
            points = 1,
        },
        [6] = {
            name = "brake2",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 180,
                ["steel"] = 180,
            },
            type = "item",
            slot = 6,
            threshold = 0,
            points = 1,
        },
        [7] = {
            name = "brake3",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 200,
                ["steel"] = 200,
            },
            type = "item",
            slot = 7,
            threshold = 0,
            points = 1,
        },
        [8] = {
            name = "transmission1",
            amount = 50,
            info = {},
            costs = {
                ["aluminum"] = 120,
                ["steel"] = 140,
            },
            type = "item",
            slot = 8,
            threshold = 0,
            points = 1,
        },
        [9] = {
            name = "transmission2",
            amount = 50,
            info = {},
            costs = {
                ["aluminum"] = 140,
                ["steel"] = 140,
            },
            type = "item",
            slot = 9,
            threshold = 0,
            points = 1,
        },
        [10] = {
            name = "transmission3",
            amount = 50,
            info = {},
            costs = {
                ["aluminum"] = 160,
                ["steel"] = 180,
            },
            type = "item",
            slot = 10,
            threshold = 0,
            points = 1,
        },
        [11] = {
            name = "suspension1",
            amount = 50,
            info = {},
            costs = {
                ["aluminum"] = 100,
                ["rubber"] = 30,
            },
            type = "item",
            slot = 11,
            threshold = 0,
            points = 1,
        },
        [12] = {
            name = "suspension2",
            amount = 50,
            info = {},
            costs = {
                ["aluminum"] = 120,
                ["rubber"] = 40,
            },
            type = "item",
            slot = 12,
            threshold = 0,
            points = 1,
        },
        [13] = {
            name = "suspension3",
            amount = 50,
            info = {},
            costs = {
                ["aluminum"] = 130,
                ["rubber"] = 50,
            },
            type = "item",
            slot = 13,
            threshold = 0,
            points = 1,
        },
        [14] = {
            name = "suspension4",
            amount = 50,
            info = {},
            costs = {
                ["aluminum"] = 150,
                ["rubber"] = 60,
            },
            type = "item",
            slot = 14,
            threshold = 0,
            points = 1,
        },
        [15] = {
            name = "turbo1",
            amount = 50,
            info = {},
            costs = {
                ["aluminum"] = 160,
                ["steel"] = 60,
            },
            type = "item",
            slot = 15,
            threshold = 0,
            points = 1,
        },
    }
}

Config.Items = {
    label = "Tuner Lager",
    slots = 30,
    items = {
        [1] = {
            name = "engine0",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
            authorizedJobGrades = {0, 1, 2}
        },
        [2] = {
            name = "brake0",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
            authorizedJobGrades = {0, 1, 2}
        },
        [3] = {
            name = "transmission0",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
            authorizedJobGrades = {0, 1, 2}
        },
        [4] = {
            name = "suspension0",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
            authorizedJobGrades = {0, 1, 2}
        },
        [5] = {
            name = "turbo0",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
            authorizedJobGrades = {0, 1, 2}
        },
    }
}