<template>
  <div class="action-log-panel">
    <div class="round-seperator">
      <b>Round 1</b>
    </div>

    <div class="turn-seperator"><span class="ally">NONjoshiii</span> turn</div>

    <div class="action-row">
      <div class="action-type">Minor</div>
      <div class="action-content">
        <span class="ally">NONjoshiii</span> use
        <span class="encounterpower">Oath of Enmity</span> target
        <span class="enemy">E1</span>
      </div>
    </div>
    <div class="action-row">
      <div class="action-type">Move</div>
      <div class="action-content">
        <span class="ally">NONjoshiii</span> use
        <span class="atwillpower">Walk</span>
      </div>
    </div>
    <div class="action-row">
      <div class="action-type">Standard</div>
      <div class="action-content">
        <span class="ally">NONjoshiii</span> uses
        <span class="encounterpower">Overwhelming Strike</span> target
        <span class="enemy">E1</span>
      </div>

      <div class="action-atkroll">
        <span class="ally">NONjoshiii</span> rolls🎲: 1d20+8: [10]+8 = 18 vs AC
        <b>Hit!</b>
      </div>
      <div class="action-dmgroll">
        <span class="ally">NONjoshiii</span> deals🎲 1d8+8: [4]+8 =
        <u><b>14 untype damage</b></u> to
        <span class="enemy">E1</span>
      </div>
    </div>
    <div class="turn-seperator"><span class="ally">Garei</span> turn</div>
  </div>
</template>

<script>
export default {
  name: "action-log-panel",
  data() {
    return {
      action_log: []
    };
  }
};
</script>

<style scoped>
.action-log-panel {
  height: 100%;
  overflow-y: scroll;
}
.round-seperator {
  width: 100%;
  margin-top: 10px;
  margin-bottom: 10px;
  text-align: center;
  background: #4d4d4f;
  color: white;
}
.turn-seperator {
  width: 100%;
  margin-top: 10px;
  margin-bottom: 10px;
  text-align: center;
  border-top: black solid 1px;
  border-bottom: black solid 1px;
}
.turn-seperator::before, .turn-seperator::after {
  content: "  ~~~~~~  ";
}
.action-row {
  display: table-row;
}
.action-type,
.action-content,
.action-atkroll,
.action-dmgroll {
  float: left;
  margin-bottom: 10px;
}
.action-type {
  border: black solid 1px;
  width: 80px;
  text-align: center;
}
.action-content,
.action-atkroll {
  /* position: absolute; */
  padding-left: 10px;
}
.action-dmgroll {
  padding-left: 90px;
}
span {
  padding: 2.5px;
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
span.atwillpower {
  background-color: #619869;
  color: white;
  border-radius: 0.5em;
  padding: 4px;
}
span.encounterpower {
  background-color: #961334;
  color: white;
  border-radius: 0.5em;
  padding: 4px;
}
span.dailypower {
  background-color: #4d4d4f;
  color: white;
  border-radius: 0.5em;
  padding: 4px;
}
</style>