<template>
  <div class="initiative-panel">
    <!-- <b>initiative-panel</b> -->
    <table>
      <tr>
        <th id="init_col">init</th>
        <th id="name_col">Name</th>
        <th id="hp_col">HP</th>
        <th id="ac_col">AC</th>
        <th id="NaD_col">NaD</th>
        <th id="surge_col">🩹</th>
      </tr>
      <InitiativeCard
        v-for="init_card in init_cards"
        v-bind:key="init_card.id"
        v-bind:init_card="init_card"
      ></InitiativeCard>
    </table>
  </div>
</template>

<script>
import InitiativeCard from "@/components/InitiativeCard.vue";

export default {
  name: "initiative-panel",
  components: {
    InitiativeCard
  },
  data() {
    return {
      init_cards: [
        {
          id: 1,
          type: "pc",
          initiative_roll: 3,
          initiative: 14,
          name: "NONjoshiii",
          current_hp: 25,
          max_hp: 30,
          ac: 16,
          fort: 13,
          ref: 14,
          will: 17,
          surge: 7,
          conditions: [
            {
              type: "buff",
              name: "Invigorating Pursuit",
              duration: "EoNT of NONjoshiii",
            },
            {
              type: "debuff",
              name: "slow",
              duration: "save end",
            },
            {
              type: "debuff",
              name: "blinded",
              duration: "EoNT of E1",
            },
          ]
        },
        {
          id: 2,
          type: "pc",
          initiative_roll: 2,
          initiative: 12,
          name: "Garei",
          current_hp: 35,
          max_hp: 40,
          ac: 20,
          fort: 15,
          ref: 14,
          will: 15,
          surge: 10,
          conditions: [],
        },
        {
          id: 3,
          type: "enemy",
          name: "E1",
          conditions: [
            {
              id: 1,
              type: "debuff",
              name: "daze",
              duration: "save end",
            },
            {
              id: 2,
              type: "debuff",
              name: "prone",
              duration: "EoNT of E1",
            },
          ]
            
        },
        {
          id: 4,
          type: "pc",
          initiative_roll: 2,
          initiative: 10,
          name: "Ken",
          current_hp: 35,
          max_hp: 40,
          ac: 20,
          fort: 15,
          ref: 14,
          will: 15,
          surge: 10,
          conditions: [],
        },
        {
          id: 5,
          type: "pc",
          initiative_roll: 2,
          initiative: 2,
          name: "Zenrar",
          current_hp: 35,
          max_hp: 42,
          ac: 17,
          fort: 14,
          ref: 11,
          will: 18,
          surge: 6,
          current_turn: "Y",
          conditions: [],
        },
      ]
    };
  }
};
</script>

<style scoped>
.initiative-panel {  
  overflow-y: scroll;
  height: 100%;
  widows: 100%;
}
table {
  width: 100%;
  border-collapse: collapse;
}
table, th {
  border: black solid 1px;
}
</style>