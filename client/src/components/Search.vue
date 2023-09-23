<template>
    <v-app>
        <div class="editor">
            <input type="text" id="keyword" name="Nkeywordame" placeholder="キーワードで検索" v-model="keyword">
        </div>
        <div class="relationImages">
            <p class="inputTitle">カテゴリー</p>
            <VueSelect name="hoge" :options="options" label="name" v-model="selectedCategory" :append-to-body="true"></VueSelect>
        </div>
        <div class="time-list">
            <div class="item">
                <p class="inputTitle">開始日</p>
                <DatePicker isStart=true  @startDateChange="startDateChange"/>
            </div>
            <div class="item">
                <p class="inputTitle">終了日</p>
                <DatePicker isStart=false  @endDateChange="endDateChange"/>
            </div>
        </div>
        <div class="search-check">
            <v-checkbox
            v-model="isMyGoal"
            label="自分の目標のみ表示" 
            color="#0000ff" />
        </div>
        <div class="search-check">
            <v-checkbox
            v-model="isShoowCompleteGoal"
            label="完了した目標も表示" 
            color="#0000ff" />
        </div>
        <div class="relationImages">
            <button class="registerButton" @click="search">検索</button>
        </div>
    </v-app>
</template>

<script>
import DatePicker from '../components/DatePicker.vue'
import DropFile from '../components/DropFile.vue'
import "vue-select/dist/vue-select.css";
import axios from 'axios';
import Cookies from 'js-cookie';

export default {
    data() {
        return {
            keyword: '',
            selectedCategory: '',
            isMyGoal: false,
            isShoowCompleteGoal: false,
            options: [],
            startDate: '',
            endDate: '',
        };
    },
    components: {
        DatePicker,
        DropFile,
    },
    mounted() {
        this.getCategoies()
    },
    methods: {
        async getCategoies() {
            try {
                const res = await axios.get(import.meta.env.VITE_APP_API_BASE + '/category')
                for(let item of res.data.categories){
                    this.options.push(item);
                }
            } catch (error) {
                console.log({ error })
            }
        },
        search() {
            this.$emit('onSearch', {
                keyword: this.keyword,
                selectedCategory: this.selectedCategory,
                isMyGoal: this.isMyGoal,
                isShoowCompleteGoal: this.isShoowCompleteGoal,
                startDate: this.startDate,
                endDate: this.endDate,
            });
        },
        startDateChange(event) {
            this.startDate = event;
        },
        endDateChange(event) {
            this.endDate = event;
        },
    }
}
</script>

<style>
.editor{
   padding: 30px;
 }

 input[type=text] {
  width: 100%;
  padding: 12px 12px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 1px solid #ccc;
  border-radius: 4px;
}
.time-list {
  display: flex;
  justify-content: space-between;
  padding-left: 30px;
  padding-right: 30px;
}
.time-list .item {
  width: 50%;
  margin: 0;
  padding: 10px;
  box-sizing: border-box;
}
.time-list .item .inputTitle {
  margin: 5px 0 0;
  padding: 0;
  font-size: 16px;
}
.relationImages {
    padding: 20px;
}
.search-check {
    padding-left: 20px;
    padding-right: 20px;
}
.registerButton{
    background: #ffa500;
    color: white;
    font-size:16px;
    font-weight:bold;
}
</style>