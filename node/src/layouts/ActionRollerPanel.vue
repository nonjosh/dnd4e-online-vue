<template>
  <div class="action-roller-panel">
    <!-- <div>ActionRollerPanel</div>     -->
    <table>
      <tr>
        <td>
          <div class="text-center">
            <select v-model="selectedCardType">
              <option
                v-for="(cardType, index) in cardTypes"
                :value="cardType.name"
                :key="index"
              >{{cardType.name}}</option>
            </select>
          </div>
        </td>
        <td>
          <div class="text-center">
            <select v-model="selectedActionType">
              <option
                v-for="(actionType, index) in actionTypes"
                :value="actionType.name"
                :key="index"
              >{{actionType.name}}</option>
            </select>
          </div>
        </td>        
        <td>
          <div class="text-center">
            <select v-model="selectedPowerType">
              <option
                v-for="(powerType, index) in powerTypes"
                :value="powerType.name"
                :key="index"
              >{{powerType.name}}</option>
            </select>
          </div>
        </td>
        <td>
          <span>Name:</span>
          <input type="text" v-model="cardname" />
        </td>
        <td></td>
        <td>
          <span>Target:</span>
          <input type="text"/>
        </td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td>
          <span>Attack roll🎲:</span>
          <input type="text" v-model="attackRollString" />
        </td>
        <td>
          <button>Roll! 🎲</button>
        </td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td>
          <span>Damage roll🎲:</span>
          <input type="text" v-model="dmgRollString" />
        </td>
        <td>
          <button>Roll! 🎲</button>
        </td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td>
          <span>Apply effect:</span>
          <input type="text" v-model="effectString" />
        </td>
        <td>
          <button>Apply!</button>
        </td>
      </tr>
    </table>
    <button>Undo↩️</button>
    <button>Pass turn🔔 </button>
    <span>Picked: {{selectedCardType}} {{selectedActionType}} {{attackRollString}}</span>
  </div>
</template>

<script>
export default {
  methods: {
    method() {
      // Perform an action
    }
  },
  data() {
    return {
      actionTypes: [
        { name: "Standard" },
        { name: "Move" },
        { name: "Minor" },
        { name: "Free" },
        { name: "Opportunity" },
        { name: "No" }
      ],
      cardTypes: [
        { name: "Initiative" },
        { name: "Skills" },
        { name: "Feats" },
        { name: "Attack Power" },
        { name: "Utility Power" },
        { name: "Items" }
      ],
      powerTypes: [
        { name: "Atwill" },
        { name: "Encounter" },
        { name: "Daily" },
      ],
      selectedActionType: "Standard",
      selectedCardType: "Attack Power",
      selectedPowerType: "Encounter",
      cardname: "Flame Spiral",
      attackRollString: "1d20+7",
      dmgRollString: "1d10+10",
      effectString: "daze",
    };
  }
};
</script>

<style scoped>
div.action-roller-panel td {
  border: none;
  padding: 5px;
  text-align: end;
}

div.action-roller-panel button {
  width: 100px;
}
</style>