local mod = get_mod("Power_DI")

local report_templates

--Report templates--
report_templates = {
    player_attack_report = {
        name = "mloc_attack_report",
        --label = "Attack report",
        dataset_name = "mloc_dataset_attack_reports",
        report_type = "pivot_table",
        columns = {"attacker_player"},
        rows = {"damage_category", "defender_type", "defender_class"},
        values = {
            {
                field_name = "health_damage",
                type = "sum",
                label = "Damage",
                visible = true,
                format = "number"
            },
            {
                field_name = "killed",
                type = "sum",
                label = "Kills",
                visible = true,
                format = "number"
            },
            {
                field_name = "damage_profile_name",
                type = "count",
                label = "hit_count",
                visible = false,
                format = "none"
            },
            {
                field_name = "critical_hit",
                type = "sum",
                label = "critical_hit_sum",
                visible = false,
                format = "none"
            },
            {
                field_name = "weakspot_hit",
                type = "sum",
                label = "weakspot_hit_sum",
                visible = false,
                format = "none"
            },
            {
                type = "calculated_field",
                label = "Crit percent",
                visible = true,
                format = "percentage",
                function_string = "critical_hit_sum/hit_count"
            },
            {
                type = "calculated_field",
                label = "Weakspot percent",
                visible = true,
                format = "percentage",
                function_string = "weakspot_hit_sum/hit_count"
            },
        },
        filters = {
            "attacker_type = \"Player\" and damage > 0 and attacker_player ~ nil and defender_type ~ nil"
        },
    },
    player_defense_report = {
        name = "mloc_defense_report",
        --label = "Defense report",
        dataset_name = "mloc_dataset_attack_reports",
        report_type = "pivot_table",
        columns = {"defender_player"},
        rows = {"attacker_type", "attacker_class"},
        values = {
            {
                field_name = "health_damage",
                type = "sum",
                label = "Damage received",
                visible = true,
                format = "number"
            },
        },
        filters = {
            "defender_type = \"Player\" and damage>0 and attacker_class ~ nil and defender_player ~ nil"
        },
    },
    player_status_report = {
        name = "mloc_player_status_report",
        --label = "Player status report",
        dataset_name = "mloc_dataset_player_status", 
        report_type = "pivot_table",
        columns = {"player"},
        rows = {"state_category", "state_name",},
        values = {
            {
                field_name = "state_name",
                type = "count",
                label = "States",
                visible = true,
                format = "number"
            },
        },
        filters = {
            "player ~ nil"
        },
    },
    player_interactions_report = {
        name = "mloc_player_interactions_report",
        --label = "Interactions report",
        dataset_name = "mloc_dataset_player_interactions",
        report_type = "pivot_table",
        columns = {"interactor_player"},
        rows = {"interaction_type", "interactee_name"},
        values = {
            {
                field_name = "interaction_type",
                type = "count",
                label = "Interactions",
                visible = true,
                format = "number"
            },
        },
        filters = {
            "event = \"interaction_stopped\" and result = \"success\" and interaction_type ~ \"default\" and interactor_player ~ nil"
        },
    },
    player_tagging_report = {
        name = "mloc_player_tagging_report",
        --label = "Tagging report",
        dataset_name = "mloc_dataset_tagging",
        report_type = "pivot_table",
        columns = {"player"},
        rows = {"tag_type", "target_type", "target_class", "target_name"},
        values = {
            {
                field_name = "target_name",
                type = "count",
                label = "Total tags",
                visible = true,
                format = "number"
            },
        },
        filters = {
            "event = \"set smart tag\" and player ~ nil"
        },
    },
    player_suppression_report = {
        name = "mloc_player_suppression_report",
        --label = "Suppression report",
        dataset_name = "mloc_dataset_player_supression",
        report_type = "pivot_table",
        columns = {"player"},
        rows = {"suppression_type"},
        values = {
            {
                field_name = "player",
                type = "count",
                label = "Suppression",
                visible = true,
                format = "number"
            },
        },
        filters = {"player ~ nil"},
    },
    player_blocked_report = {
        name = "mloc_player_blocked_report",
        --label = "Block report",
        dataset_name = "mloc_dataset_blocked_attacks",
        report_type = "pivot_table",
        columns = {"player"},
        rows = {"enemy_type", "enemy_class", "enemy_name"},
        values = {
            {
                field_name = "player",
                type = "count",
                label = "Blocks",
                visible = true,
                format = "number"
            },
        },
        filters = {"player ~ nil"},
    },
    player_slots_report = {
        name = "mloc_player_slots_report",
        --label = "Slots report",
        dataset_name = "mloc_dataset_slot_events",
        report_type = "pivot_table",
        columns = {"player"},
        rows = {"slot_name", "event"},
        values = {
            {
                field_name = "player",
                type = "count",
                label = "Slots",
                visible = true,
                format = "number"
            },
        },
        filters = {"player ~ nil"},
    },
    player_abilities_report = {
        name = "mloc_player_abilities_report",
        --label = "Player abilities report",
        dataset_name = "mloc_dataset_player_abilities",
        report_type = "pivot_table",
        columns = {"player"},
        rows = {"ability_type"},
        values = {
            {
                field_name = "player",
                type = "count",
                label = "Player abilities",
                visible = true,
                format = "number"
            },
        },
        filters = {"event_type = \"Charge used\" and player ~ nil"},
    },
    player_buffs_report = {
        name = "mloc_player_buffs_report",
        --label = "Player buffs report",
        dataset_name = "mloc_dataset_player_buffs",
        report_type = "pivot_table",
        columns = {"player"},
        rows = {"source_category", "source_name", "event", "template_name"},
        values = {
            {
                field_name = "player",
                type = "count",
                label = "Buffs",
                visible = true,
                format = "number"
            },
        },
        filters = {"player ~ nil"},
    },
}

return report_templates