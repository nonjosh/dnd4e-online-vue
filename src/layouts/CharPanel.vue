<template>
    <div class="char-panel">
        <meta charset="utf-8">
        <div><h2>{{char_name}}</h2></div>
        <!-- <div class="stat-list">
            <h3>Stat</h3>
            <div v-for="stat in char_stat" :key="stat.name">{{stat.name}}: {{stat.value}}</div>
        </div> -->
        <div class="feat-list">
            <h3>Feats</h3>
            <div v-for="feat in char_feats" :key="feat.name"><a v-bind:href=feat.url target="result">{{feat.name}}</a></div>
        </div>
        <div class="power-list">
            <h3>Powers</h3>
            <div v-for="power in char_powers" :key="power.name"><a v-bind:href=power.url target="result">{{power.name}}</a></div>
        </div>
        <div class="item-list">
            <h3>Items</h3>
            <div v-for="(item, item_name, index) in char_items" :key="index"><a v-bind:href=item.url target="result">{{item_name}}</a> *{{item.count}}</div>
        </div>
        <div class="resultview">
            <iframe name="result"></iframe>
        </div>
    </div>
</template>

<script>
import xml2js from 'xml2js';
import axios from 'axios';

export default {
    name: 'CharPanel',
    data() {
        return {
            file_data: "",
            char_url: "http://nonjosh.com/downloads/char/nonjoshiii.dnd4e",
            char_name: "",
            char_stat: [],
            char_feats: [],
            char_powers: [],
            char_items: [],
        }
    },    
    mounted() {

        axios.get(this.char_url)
        .then(response => {
            var parser = new xml2js.Parser();
            this.file_data = response.data;            

            let char_json;
            parser.parseString(response.data, (err, rst) => {
                char_json = rst;
            });

            // render char name
            this.char_name = char_json.D20Character.CharacterSheet[0].Details[0].name[0];

            // render char stat
            let char_stat = char_json.D20Character.CharacterSheet[0].StatBlock[0].Stat;
            char_stat.forEach((stat_obj) => {
                const stat_obj_name = stat_obj.alias[0].$.name;
                const stat_obj_value = stat_obj.$.value;
                if (stat_obj_name.endsWith('Defense') || stat_obj_name.endsWith('AC') || stat_obj_name.endsWith('Initiative') || stat_obj_name.endsWith('Hit Points')){
                    let stat = {};
                    stat.name = stat_obj_name;
                    stat.value = stat_obj_value;
                    this.char_stat.push(stat)
                }
            });

            // feat list\
            var RulesElementTally = char_json.D20Character.CharacterSheet[0].RulesElementTally[0].RulesElement;
            RulesElementTally.forEach(RulesElement => {
                var element_type = RulesElement.$.type;
                if (element_type == 'Feat') {
                    var feat = {};
                    feat.name = RulesElement.$.name;
                    feat.url = feat.name.replace(/ \(Strength\)| \(Constitution\)| \(Dexterity\)| \(Intelligence\)| \(Wisdom\)| \(Charisma\)/, "");
                    feat.url = feat.url.replaceAll(" ", "-").replaceAll("'", "");
                    feat.url = "http://data.dnd.nonjosh.com/compendium/feat/" + feat.url + ".html";
                    this.char_feats.push(feat);
                }
            });

            // render power list
            const char_powers = char_json.D20Character.CharacterSheet[0].PowerStats[0].Power;
            char_powers.forEach((power_obj) => {        
                let power_name = power_obj.$.name;
                let power_use = power_obj.specific[0]._;
                let power_action = power_obj.specific[1]._;
                
                let power = {};
                power.name = power_name;
                power.use = power_use;
                power.action = power_action;
                power.url = "http://data.dnd.nonjosh.com/compendium/power/" + power_name.replaceAll(" ", "-").replaceAll("'", "") + ".html";
                this.char_powers.push(power);
            });
            

            // render item List
            var LevelArray = char_json.D20Character.Level;

            var ItemList = {};

            LevelArray.forEach((Level) => {
                if (Level.loot !== undefined) {
                    try {
                        var lootArray = Level.loot;
                        lootArray.forEach((loot) =>{
                            var lootElement = loot.RulesElement;
                            var lootName = lootElement[lootElement.length - 1].$.name;
                            var lootCount = loot.$.count;
                            var loottype = lootElement[lootElement.length - 1].$.type;
                            var lootEquip = loot.$["equip-count"];
                            if (loottype === "Magic Item") {
                                if (ItemList[lootName] !== undefined) {
                                    ItemList[lootName].count += parseInt(lootCount);
                                } else {
                                    ItemList[lootName] = {};
                                    ItemList[lootName].count = parseInt(lootCount);
                                    if (lootElement[lootElement.length - 1].$["internal-id"].includes("CONSUMABLE")) {
                                        ItemList[lootName].type = "CONSUMABLE";
                                    } else {
                                        ItemList[lootName].type = "MAGIC_ITEM";
                                    }
                                    var url = lootName.replace(/ \(heroic tier\)| \(paragon tier\)| \(epic tier\)/, "");
                                    if (url.lastIndexOf(' (level') > -1) {url = url.substring(0, url.lastIndexOf(' (level'));}
                                    url = url.replace(/ \+1| \+2| \+3| \+4| \+5| \+6|/g, "");
                                    url = url.replaceAll(" ", "-").replaceAll("'", "");
                                    url = url.replaceAll(/\(|\)/g, "");
                                    ItemList[lootName].url = "http://data.dnd.nonjosh.com/compendium/item/" + url + ".html";
                                }
                                ItemList[lootName].equip = parseInt(lootEquip);
                                if (ItemList[lootName].count == 0) {
                                    delete ItemList[lootName];
                                }
                            }
                        })
                    } catch(err) {
                        console.log("An error occurred");
                        console.log(lootArray);
                        console.log(err);
                    }
                }
            })

            this.char_items = ItemList;
            // console.log(this.char_items);
        })
        .catch(err => {
            // Manage the state of the application if the request 
            // has failed
            console.log(err);
        })
    }
}
</script>

<style>
.feat-list {
    float: left;
}
.power-list {
    float: left;
}
.item-list {
    float: left;
}
.resultview {
    width: 40vw;
    height: 80vh;
    float: left;
}
iframe {
    width: 100%;
    height: 100%;
}
</style>