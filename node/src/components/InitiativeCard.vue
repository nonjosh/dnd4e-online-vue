<template>
  <TBODY>
    <tr class="main-row">
      <td id="init_col" rowspan="2">
        <span v-if="init_card.current_turn=='Y'">🟢</span>
        {{init_card.initiative}}
        <span v-if="init_card.type=='enemy'">?</span>
      </td>
      <td id="name_col" v-if="init_card.type=='pc'">
        <span class="ally">{{init_card.name}}</span>
      </td>
      <td id="name_col" v-if="init_card.type=='enemy'">
        <span class="enemy">{{init_card.name}}</span>
      </td>
      <td id="hp_col">{{init_card.current_hp}}/{{init_card.max_hp}}</td>
      <td id="ac_col">{{init_card.ac}}</td>
      <td id="NaD_col">{{init_card.fort}}/{{init_card.ref}}/{{init_card.will}}</td>
      <td id="surge_col">{{init_card.surge}}</td>
    </tr>
    <tr>
      <td colspan="6">
        <span
          v-for="condition in buffs"
          v-bind:key="condition.id"
          class="buff"
          v-tooltip="condition.duration"
        >{{condition.name}}</span>
        <span
          v-for="condition in debuffs"
          v-bind:key="condition.id"
          class="debuff"
          v-tooltip="condition.duration"
        >
          {{condition.name}}
          <span v-if="condition.duration=='save end'">🎲</span>
        </span>
      </td>
    </tr>
  </TBODY>
</template>

<script>
export default {
  name: "initiative-card",
  props: {
    init_card: Object
  },
  computed: {
    buffs: function() {
      return this.init_card.conditions.filter(i => i.type == "buff");
    },
    debuffs: function() {
      return this.init_card.conditions.filter(i => i.type == "debuff");
    }
  }
};
</script>

<style lang="scss">
td {
  border: black solid 1px;
  text-align: center;
}
tr.main-row {
  height: 3vh;
}
span.ally {
  background-color: green;
  color: white;
  border-radius: 0.5em;
  padding: 3px;
}
span.enemy {
  background-color: red;
  color: white;
  border-radius: 0.5em;
  padding: 3px;
}
span.buff {
  background-color: yellowgreen;
  color: white;
  font-size: 12px;
  border-radius: 0.5em;
  padding: 1px;
  margin: 3px;
}
span.debuff {
  background-color: grey;
  color: white;
  font-size: 12px;
  border-radius: 0.5em;
  padding: 1px;
  margin: 3px;
}
.tooltip {
  display: block !important;
  z-index: 10000;

  .tooltip-inner {
    background: black;
    color: white;
    border-radius: 16px;
    padding: 5px 10px 4px;
  }

  .tooltip-arrow {
    width: 0;
    height: 0;
    border-style: solid;
    position: absolute;
    margin: 5px;
    border-color: black;
    z-index: 1;
  }

  &[x-placement^="top"] {
    margin-bottom: 5px;

    .tooltip-arrow {
      border-width: 5px 5px 0 5px;
      border-left-color: transparent !important;
      border-right-color: transparent !important;
      border-bottom-color: transparent !important;
      bottom: -5px;
      left: calc(50% - 5px);
      margin-top: 0;
      margin-bottom: 0;
    }
  }

  &[x-placement^="bottom"] {
    margin-top: 5px;

    .tooltip-arrow {
      border-width: 0 5px 5px 5px;
      border-left-color: transparent !important;
      border-right-color: transparent !important;
      border-top-color: transparent !important;
      top: -5px;
      left: calc(50% - 5px);
      margin-top: 0;
      margin-bottom: 0;
    }
  }

  &[x-placement^="right"] {
    margin-left: 5px;

    .tooltip-arrow {
      border-width: 5px 5px 5px 0;
      border-left-color: transparent !important;
      border-top-color: transparent !important;
      border-bottom-color: transparent !important;
      left: -5px;
      top: calc(50% - 5px);
      margin-left: 0;
      margin-right: 0;
    }
  }

  &[x-placement^="left"] {
    margin-right: 5px;

    .tooltip-arrow {
      border-width: 5px 0 5px 5px;
      border-top-color: transparent !important;
      border-right-color: transparent !important;
      border-bottom-color: transparent !important;
      right: -5px;
      top: calc(50% - 5px);
      margin-left: 0;
      margin-right: 0;
    }
  }

  &[aria-hidden="true"] {
    visibility: hidden;
    opacity: 0;
    transition: opacity 0.15s, visibility 0.15s;
  }

  &[aria-hidden="false"] {
    visibility: visible;
    opacity: 1;
    transition: opacity 0.15s;
  }
}
</style>