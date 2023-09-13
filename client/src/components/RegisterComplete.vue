<script>
export default {
    methods: {
        showAdd() {
            this.$router.push({
                name: 'GoalAdd',
                params: {
                    index: 1,
                },
            });
        },
    }
}
</script>

<template>
    <v-app>
        <div class="complete">
            <h1 class="completeTitle">登録完了しました</h1>
            <div class="homeButtons">
                <button class="commonButton" @click="showAdd">他の目標を登録する</button>
            </div>
        </div>
    </v-app>
</template>

<style>
.complete {
    position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
  height: 80px;
}
.completeTitle {      
    text-align: center;
    font-size: 20px;
}
.homeButtons {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.homeButtons button {
    margin-top: 20px;
    margin-bottom: 20px;
}
</style>