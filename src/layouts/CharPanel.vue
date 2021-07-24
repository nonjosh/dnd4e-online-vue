<template>
  <div class="char-panel">
    <v-tabs>
      <v-tab>{{ char_name }}</v-tab>
    </v-tabs>
    <div class="detail-list">
      <v-tabs v-model="tab">
        <!-- <v-tab> Stat </v-tab> -->
        <v-tab> Feats </v-tab>
        <v-tab> Powers </v-tab>
        <v-tab> Items </v-tab>
      </v-tabs>
      <v-tabs-items v-model="tab">
        <v-tab-item v-for="item in items" :key="item.tab">
          <!-- <div v-if="item.tab == 'Stat'">
            <div v-for="stat in char_stat" :key="stat.name">
              {{ stat.name }}: {{ stat.value }}
            </div>
          </div> -->
          <div v-if="item.tab == 'Feats'">
            <div v-for="feat in char_feats" :key="feat.name">
              <v-btn small block v-bind:href="feat.url" target="result">{{
                feat.name
              }}</v-btn>
            </div>
          </div>
          <div v-if="item.tab == 'Powers'">
            <div v-for="power in char_powers" :key="power.name">
              <v-btn small block v-bind:href="power.url" target="result">{{
                power.name
              }}</v-btn>
            </div>
          </div>
          <div v-if="item.tab == 'Items'">
            <h4>Equipped</h4>
            <v-divider></v-divider>
            <div v-for="(item, index) in char_items" :key="'E' + index">
              <div v-if="item.equip == 1">
                <v-btn small v-bind:href="item.url" target="result">{{
                  item.name
                }}</v-btn>
                *{{ item.count }}
              </div>
            </div>
            <v-divider></v-divider>
            <h4>Consumables</h4>
            <v-divider></v-divider>
            <div v-for="(item, index) in char_items" :key="'C' + index">
              <div v-if="item.count > 1">
                <v-btn small v-bind:href="item.url" target="result">{{
                  item.name
                }}</v-btn>
                *{{ item.count }}
              </div>
            </div>
            <v-divider></v-divider>
            <h4>Others</h4>
            <v-divider></v-divider>
            <div v-for="(item, index) in char_items" :key="'O' + index">
              <div v-if="item.count == 1 && item.equip == 0">
                <v-btn small v-bind:href="item.url" target="result">{{
                  item.name
                }}</v-btn>
                *{{ item.count }}
              </div>
            </div>
          </div>
        </v-tab-item>
      </v-tabs-items>
    </div>
    <div class="resultview">
      <iframe name="result"></iframe>
    </div>
  </div>
</template>

<script>
import xml2js from "xml2js";
import axios from "axios";

export default {
  name: "CharPanel",
  data() {
    return {
      file_data: "",
      char_url: "https://nonjosh.com/downloads/char/nonjoshiii.dnd4e",
      char_name: "",
      char_stat: [],
      char_feats: [],
      char_powers: [],
      char_items: [],
      tab: null,
      items: [
        // { tab: "Stat", content: "Stat Content" },
        { tab: "Feats", content: "Feats Content" },
        { tab: "Powers", content: "Powers Content" },
        { tab: "Items", content: "Items Content" },
      ],
    };
  },
  mounted() {
    axios
      .get(this.char_url)
      .then((response) => {
        var parser = new xml2js.Parser();
        this.file_data = response.data;

        let char_json;
        parser.parseString(response.data, (err, rst) => {
          char_json = rst;
        });

        // render char name
        this.char_name =
          char_json.D20Character.CharacterSheet[0].Details[0].name[0];

        // render char stat
        const char_stat =
          char_json.D20Character.CharacterSheet[0].StatBlock[0].Stat;
        char_stat.forEach((stat_obj) => {
          const stat_obj_name = stat_obj.alias[0].$.name;
          const stat_obj_value = stat_obj.$.value;
          if (
            stat_obj_name.endsWith("Defense") ||
            stat_obj_name.endsWith("AC") ||
            stat_obj_name.endsWith("Initiative") ||
            stat_obj_name.endsWith("Hit Points")
          ) {
            let stat = {};
            stat.name = stat_obj_name;
            stat.value = stat_obj_value;
            this.char_stat.push(stat);
          }
        });

        // feat list\
        const RulesElementTally =
          char_json.D20Character.CharacterSheet[0].RulesElementTally[0]
            .RulesElement;
        RulesElementTally.forEach((RulesElement) => {
          var element_type = RulesElement.$.type;
          if (element_type == "Feat") {
            var feat = {};
            feat.name = RulesElement.$.name;
            feat.url = feat.name.replace(
              / \(Strength\)| \(Constitution\)| \(Dexterity\)| \(Intelligence\)| \(Wisdom\)| \(Charisma\)/,
              ""
            );
            feat.url = feat.url.replaceAll(" ", "-").replaceAll("'", "");
            feat.url =
              "http://data.dnd.nonjosh.com/compendium/feat/" +
              feat.url +
              ".html";
            this.char_feats.push(feat);
          }
        });

        // render power list
        const char_powers =
          char_json.D20Character.CharacterSheet[0].PowerStats[0].Power;
        char_powers.forEach((power_obj) => {
          let power = {};
          power.name = power_obj.$.name;
          power.use = power_obj.specific[0]._;
          power.action = power_obj.specific[1]._;
          power.url =
            "http://data.dnd.nonjosh.com/compendium/power/" +
            power.name.replaceAll(" ", "-").replaceAll("'", "") +
            ".html";
          this.char_powers.push(power);
        });

        // render item list
        const LootTally =
          char_json.D20Character.CharacterSheet[0].LootTally[0].loot;
        LootTally.forEach((lootObj) => {
          // console.log(lootObj);
          var item = {};
          const RulesElement =
            lootObj.RulesElement[lootObj.RulesElement.length - 1];
          item.name = RulesElement.$["name"];

          const adv_gear = [
            "Adventurer's Kit",
            "Climber's Kit",
            "Thieves' Tools",
            "Tent",
            "Fire Kit",
            "Torch",
            "Common Meal",
            "Alchemical Reagents (Arcana)",
          ];
          if (adv_gear.includes(item.name)) {
            return;
          }

          item.count = parseInt(lootObj.$.count);

          item.equip = lootObj.$["equip-count"] == "1";
          var url = item.name.replace(
            / \(heroic tier\)| \(paragon tier\)| \(epic tier\)/,
            ""
          );
          if (url.lastIndexOf(" (level") > -1) {
            url = url.substring(0, url.lastIndexOf(" (level"));
          }
          url = url.replace(/ \+1| \+2| \+3| \+4| \+5| \+6|/g, "");
          url = url.replaceAll(" ", "-").replaceAll("'", "");
          url = url.replaceAll(/\(|\)/g, "");
          item.url =
            "http://data.dnd.nonjosh.com/compendium/item/" + url + ".html";

          this.char_items.push(item);
        });
        // sort item list
        function compare(a, b) {
          if (a.name < b.name) {
            return -1;
          }
          if (a.name > b.name) {
            return 1;
          }
          return 0;
        }
        this.char_items.sort(compare);
      })
      .catch((err) => {
        // Manage the state of the application if the request
        // has failed
        console.log(err);
      });
  },
};
</script>

<style lang="scss">
.detail-list {
  width: 30vw;
  height: 95vh;
  float: left;
  overflow-y: scroll;
}
.resultview {
  width: 40vw;
  height: 80vh;
  float: left;
}
iframe {
  width: 32vw;
  height: 100%;
}
.v-btn,
.v-tab {
  text-transform: none;
}
</style>
