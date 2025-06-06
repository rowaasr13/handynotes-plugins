local ADDON_NAME, ns = ...
local L = ns.NewLocale('deDE')
if not L then return end
-- German Translation by Dathwada EU-Eredar and Ioney EU-Blackrock
-------------------------------------------------------------------------------
------------------------------------ GEAR -------------------------------------
-------------------------------------------------------------------------------

L['bag'] = 'Tasche'
L['cloth'] = 'Stoff'
L['leather'] = 'Leder'
L['mail'] = 'Kette'
L['plate'] = 'Platte'
L['cosmetic'] = 'Kosmetisch'
L['tabard'] = 'Wappenrock'

L['1h_mace'] = 'Einhandstreitkolben'
L['1h_sword'] = 'Einhandschwert'
L['1h_axe'] = 'Einhandaxt'
L['2h_mace'] = 'Zweihandstreitkolben'
L['2h_axe'] = 'Zweihandaxt'
L['2h_sword'] = 'Zweihandschwert'
L['shield'] = 'Schild'
L['dagger'] = 'Dolch'
L['staff'] = 'Stab'
L['fist'] = 'Faustwaffe'
L['polearm'] = 'Stangenwaffe'
L['bow'] = 'Bogen'
L['gun'] = 'Schusswaffe'
L['wand'] = 'Zauberstab'
L['crossbow'] = 'Armbrust'
L['offhand'] = 'Nebenhand'
L['warglaive'] = 'Kriegsgleve'

L['ring'] = 'Finger'
L['neck'] = 'Hals'
L['cloak'] = 'Umhang'
L['trinket'] = 'Schmuck'

-------------------------------------------------------------------------------
---------------------------------- TOOLTIPS -----------------------------------
-------------------------------------------------------------------------------

L['activation_unknown'] = 'Aktivierung unbekannt!'
L['requirement_not_found'] = 'Voraussetzungsort unbekannt!'
L['multiple_spawns'] = 'Kann an mehreren Orten erscheinen.'
L['shared_drops'] = 'Geteilte Beute'
L['zone_drops_label'] = 'Zonenbeute'
L['zone_drops_note'] = 'Die unten aufgeführten Gegenstände können von mehreren Gegnern in dieser Zone fallen gelassen werden.'

L['poi_entrance_label'] = 'Eingang'
L['change_map'] = 'Karte wechseln'

L['requires'] = 'Benötigt'
L['ranked_research'] = '%s (Rang %d/%d)'

L['focus'] = 'fokussieren'
L['retrieving'] = 'Gegenstandslink wird abgerufen ...'

L['normal'] = 'Normal'
L['hard'] = 'Schwer'

L['completed'] = 'Abgeschlossen'
L['incomplete'] = 'Unvollständig'
L['claimed'] = 'Erhalten'
L['unclaimed'] = 'Fehlt'
L['known'] = 'Bekannt'
L['missing'] = 'Fehlt'
L['unobtainable'] = 'Nicht erhältlich'
L['unlearnable'] = 'Nicht erlernbar'
L['defeated'] = 'Besiegt'
L['undefeated'] = 'Unbesiegt'
L['elite'] = 'Elite'
L['quest'] = 'Quest'
L['quest_repeatable'] = 'Wiederholbare Quest'
L['achievement'] = 'Erfolg'

---------------------------------- LOCATION -----------------------------------
L['in_cave'] = 'In einer Höhle.'
L['in_small_cave'] = 'In einer kleinen Höhle.'
L['in_water_cave'] = 'In einer Unterwasserhöhle.'
L['in_waterfall_cave'] = 'In einer Höhle hinter einem Wasserfall.'
L['in_water'] = 'Im Wasser.'
L['in_building'] = 'Im Gebäude.'

------------------------------------ TIME -------------------------------------
L['now'] = 'Jetzt'
L['hourly'] = 'Stündlich'
L['daily'] = 'Täglich'
L['weekly'] = 'Wöchentlich'

L['time_format_12hrs'] = '%d.%m - %I:%M %p'
L['time_format_24hrs'] = '%d.%m - %H:%M'

----------------------------------- REWARDS -----------------------------------
L['heirloom'] = 'Erbstück'
L['item'] = 'Gegenstand'
L['mount'] = 'Reittier'
L['pet'] = 'Haustier'
L['recipe'] = 'Rezept'
L['spell'] = 'Fähigkeit'
L['title'] = 'Titel'
L['toy'] = 'Spielzeug'
L['currency'] = 'Währung'
L['rep'] = 'Ruf'
L['buff'] = 'Stärkungszauber'
L['transmog'] = 'Ausrüstungsvorlage'
L['hunter_pet'] = 'Jäger Begleiter'

---------------------------------- FOLLOWERS ----------------------------------
L['follower_type_follower'] = 'Anhänger'
L['follower_type_champion'] = 'Champion'
L['follower_type_companion'] = 'Abenteurer'

--------------------------------- REPUTATION ----------------------------------
L['rep_honored'] = 'Wohlwollend'
L['rep_revered'] = 'Respektvoll'
L['rep_exalted'] = 'Erfürchtig'

-------------------------------------------------------------------------------
------------------------------- SKYRIDING RACES -------------------------------
-------------------------------------------------------------------------------

L['sr_your_best_time'] = 'Deine beste Zeit:'
L['sr_your_target_time'] = 'Vorgabezeit:'
L['sr_best_time'] = ' - %s: %.3fs'
L['sr_target_time'] = ' - %s: %ss / %ss'
L['sr_normal'] = 'Normal'
L['sr_advanced'] = 'Fortgeschritten'
L['sr_reverse'] = 'Umgekehrt'
L['sr_challenge'] = 'Herausforderung'
L['sr_reverse_challenge'] = 'Umgekehrte Herausforderung'
L['sr_storm_race'] = 'Sturmrennen'
L['sr_bronze'] = 'Beende das Rennen um ' .. ns.color.Bronze('Bronze') .. ' zu erhalten.'
L['sr_vendor_note'] = 'Tausche {currency:2588} gegen Drachenwächtermanuskripte und Ausrüstungsvorlagen ein.'
L['options_icons_skyriding_race'] = 'Himmelsreitenrennen'
L['options_icons_skyriding_race_desc'] = 'Zeigt die Positionen der Himmelsreitenrennen an.'

-------------------------------------------------------------------------------
--------------------------------- CONTEXT MENU --------------------------------
-------------------------------------------------------------------------------

L['context_menu_set_waypoint'] = 'Kartenmarkierung setzen'
L['context_menu_add_tomtom'] = 'Zu TomTom hinzufügen'
L['context_menu_add_group_tomtom'] = 'Gruppe zu TomTom hinzufügen'
L['context_menu_add_focus_group_tomtom'] = 'Verwandte Punkte zu TomTom hinzufügen'
L['context_menu_hide_node'] = 'Verstecke diesen Punkt'
L['context_menu_restore_hidden_nodes'] = 'Versteckte Punkte wiederherstellen'

L['map_button_text'] = 'Passe die Symbolanzeige, die Transparenz und die Größe für diese Karte an.'

-------------------------------------------------------------------------------
----------------------------------- OPTIONS -----------------------------------
-------------------------------------------------------------------------------

L['options_global'] = 'Global'
L['options_zones'] = 'Zonen'

L['options_general_description'] = 'Einstellungen, die das Verhalten von Punkten und deren Belohnungen steuern.'
L['options_global_description'] = 'Einstellungen, die die Darstellung aller Punkte in allen Zonen steuern.'
L['options_zones_description'] = 'Einstellungen, die die Darstellung von Punkten in jeder einzelnen Zone steuern.'

L['options_open_settings_panel'] = 'Einstellungsmenü öffnen ...'
L['options_open_world_map'] = 'Weltkarte öffnen'
L['options_open_world_map_desc'] = 'Öffnet diese Zone auf der Weltkarte.'

------------------------------------ ICONS ------------------------------------

L['options_icon_settings'] = 'Symboleinstellungen'
L['options_scale'] = 'Größe'
L['options_scale_desc'] = '1 = 100%'
L['options_opacity'] = 'Transparenz'
L['options_opacity_desc'] = '0 = transparent, 1 = undurchsichtig'

---------------------------------- VISIBILITY ---------------------------------

L['options_show_worldmap_button'] = 'Zeige den Weltkartenbutton'
L['options_show_worldmap_button_desc'] = 'Fügt der Weltkarte in der rechten oberen Ecke einen Button hinzu, womit per Dropdownmenü schnell auf Einstellungen zugegriffen werden kann.'

L['options_visibility_settings'] = 'Sichtbarkeit'
L['options_general_settings'] = 'Allgemeines'
L['options_show_completed_nodes'] = 'Zeige bereits abgeschlossenes'
L['options_show_completed_nodes_desc'] = 'Zeigt alle Punkte an, auch wenn diese heute bereits geplündert oder abgeschlossen wurden.'
L['options_toggle_hide_done_rare'] = 'Blende seltene Gegner aus, deren Belohnungen bekannt sind'
L['options_toggle_hide_done_rare_desc'] = 'Blendet alle seltenen Gegner deren Beute bereits bekannt ist aus.'
L['options_toggle_hide_done_treasure'] = 'Blende Schätze aus, deren Belohnungen bekannt sind'
L['options_toggle_hide_done_treasure_desc'] = 'Blendet alle Schätze deren Beute bereits bekannt ist aus.'
L['options_toggle_hide_minimap'] = 'Blende alle Symbole auf der Minikarte aus'
L['options_toggle_hide_minimap_desc'] = 'Blendet alle Symbole dieses Addons auf der Minikarte aus und zeigt sie nur auf der Hauptkarte an.'
L['options_toggle_maximized_enlarged'] = 'Symbole bei maximierter Weltkarte vergrößern'
L['options_toggle_maximized_enlarged_desc'] = 'Wenn die Weltkarte maximiert ist, werden alle Symbole vergrößert.'
L['options_toggle_use_char_achieves'] = 'Verwende charakterspezifische Erfolge'
L['options_toggle_use_char_achieves_desc'] = 'Zeigt den Erfolgsfortschritt von diesem Charakter, anstelle des gesamten Accounts an.'
L['options_toggle_per_map_settings'] = 'Verwende zonenspezifische Einstellungen'
L['options_toggle_per_map_settings_desc'] = 'Die Einstellungen zum Anzeigen/Ausblenden, die Größe und die Transparenz der Symbole werden auf jede Zone einzeln angewendet.'
L['options_restore_hidden_nodes'] = 'Versteckte Punkte wiederherstellen'
L['options_restore_hidden_nodes_desc'] = 'Stellt alle Punkte wieder her, die über das Kontextmenü versteckt wurden.'

L['ignore_class_restrictions'] = 'Zeige Klassenspezifisches'
L['ignore_class_restrictions_desc'] = 'Zeigt Gruppen, Punkte und Belohnungen an, die eine andere Klasse als die des derzeitigen Charakters benötigen.'
L['ignore_faction_restrictions'] = 'Zeige Fraktionsspezifisches'
L['ignore_faction_restrictions_desc'] = 'Zeigt Gruppen, Punkte und Belohnungen an, die eine andere Fraktion als die des derzeitigen Charakters benötigen.'

L['options_rewards_settings'] = 'Belohnungen'
L['options_reward_behaviors_settings'] = 'Verhalten von Belohnungen'
L['options_reward_types'] = 'Zeige Belohnungstypen'
L['options_manuscript_rewards'] = 'Zeige Drachenwächtermanuskriptbelohnungen'
L['options_manuscript_rewards_desc'] = 'Zeige Drachenwächtermanuskriptbelohnungen in Tooltips an und verfolge ihren Sammlungsstatus.'
L['options_mount_rewards'] = 'Zeige Reittierbelohnungen'
L['options_mount_rewards_desc'] = 'Zeige Reittierbelohnungen in Tooltips an und verfolge ihren Sammlungsstatus.'
L['options_pet_rewards'] = 'Zeige Haustierbelohnungen'
L['options_pet_rewards_desc'] = 'Zeige Haustierbelohnungen in Tooltips an und verfolge ihren Sammlungsstatus.'
L['options_recipe_rewards'] = 'Zeige Rezeptbelohnungen'
L['options_recipe_rewards_desc'] = 'Zeige Rezeptbelohnungen für bekannte Berufe in Tooltips an und verfolge ihren Sammlungsstatus.'
L['options_toy_rewards'] = 'Zeige Spielzeugbelohnungen'
L['options_toy_rewards_desc'] = 'Zeige Spielzeugbelohnungen in Tooltips an und verfolge ihren Sammlungsstatus.'
L['options_transmog_rewards'] = 'Zeige Vorlagenbelohnungen'
L['options_transmog_rewards_desc'] = 'Zeige Vorlagenbelohnungen für Waffen und Rüstungen in Tooltips an und verfolge ihren Sammlungsstatus.'
L['options_all_transmog_rewards'] = 'Zeige nicht erhältliche Vorlagenbelohnungen'
L['options_all_transmog_rewards_desc'] = 'Zeigt Vorlagenbelohnungen an, die nur für andere Klassen erhältlich sind.'
L['options_rep_rewards'] = 'Zeige Rufbelohnungen'
L['options_rep_rewards_desc'] = 'Zeige Rufbelohnungen in Tooltips an und verfolge ihren Sammlungsstatus.'
L['options_claimed_rep_rewards'] = 'Zeige erhaltene Rufbelohnungen'
L['options_claimed_rep_rewards_desc'] = 'Zeigt Rufbelohnungen an, die bereits von deiner Kriegsmeute erhalten wurden.'

L['options_icons_misc_desc'] = 'Zeigt die Positionen von anderen nicht kategorisierten Punkten an.'
L['options_icons_misc'] = 'Sonstiges'
L['options_icons_pet_battles_desc'] = 'Zeigt die Positionen von Kampfhaustiertrainern und NPCs an.'
L['options_icons_pet_battles'] = 'Kampfhaustiere'
L['options_icons_rares_desc'] = 'Zeigt die Positionen von seltenen Gegnern an.'
L['options_icons_rares'] = 'Seltene Gegner'
L['options_icons_treasures_desc'] = 'Zeigt die Positionen versteckter Schätze an.'
L['options_icons_treasures'] = 'Schätze'
L['options_icons_vendors_desc'] = 'Zeigt die Positionen von Händlern an.'
L['options_icons_vendors'] = 'Händler'

---------------------------------- FOCUS ---------------------------------

L['options_focus_settings'] = 'Orte von Interesse'
L['options_poi_color'] = 'Punktfarbe'
L['options_poi_color_desc'] = 'Legt die Farbe für Punkte fest, wenn ein Symbol fokussiert ist.'
L['options_path_color'] = 'Wegfarbe'
L['options_path_color_desc'] = 'Legt die Farbe des Weges fest, wenn ein Symbol fokussiert ist.'
L['options_reset_poi_colors'] = 'Farben zurücksetzen'
L['options_reset_poi_colors_desc'] = 'Setzt die obigen Farben auf ihre Standardeinstellungen zurück.'

---------------------------------- TOOLTIP ---------------------------------

L['options_tooltip_settings'] = 'Tooltip'
L['options_toggle_show_loot'] = 'Zeige Beute'
L['options_toggle_show_loot_desc'] = 'Zeigt Beuteinformationen im Tooltip an.'
L['options_toggle_show_notes'] = 'Zeige Notizen'
L['options_toggle_show_notes_desc'] = 'Zeigt hilfreiche Notizen an sofern diese verfügbar sind.'
L['options_toggle_use_standard_time'] = 'Verwende das 12-Stunden-Format'
L['options_toggle_use_standard_time_desc'] = 'Zeigt die Uhrzeit im 12-Stunden-Format (z.B.: 8:00 PM) anstelle des 24-Stunden-Formates (z.B.: 20:00) in Tooltips an.'
L['options_toggle_show_npc_id'] = 'Zeige NPC ID'
L['options_toggle_show_npc_id_desc'] = 'Zeigt die ID des NPCs im Tooltip an.'

--------------------------------- DEVELOPMENT ---------------------------------

L['options_dev_settings'] = 'Entwicklung'
L['options_toggle_show_debug_currency'] = 'Debug Währungs IDs'
L['options_toggle_show_debug_currency_desc'] = 'Zeigt Debug-Informationen für Änderungen bei Währungs-IDs an (Neuladen erforderlich).'
L['options_toggle_show_debug_map'] = 'Debug Karten IDs'
L['options_toggle_show_debug_map_desc'] = 'Zeigt Debug-Informationen für Karten an.'
L['options_toggle_show_debug_quest'] = 'Debug Quest IDs'
L['options_toggle_show_debug_quest_desc'] = 'Zeigt Debug-Informationen für Änderungen bei Quest-IDs an (Neuladen erforderlich).'
L['options_toggle_force_nodes'] = 'Erzwinge Punkte'
L['options_toggle_force_nodes_desc'] = 'Anzeige aller Punkte erzwingen.'
