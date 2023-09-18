<template>
    <v-app>
        <div class="relationImages">
            <p class="inputTitle">対象タスク</p>
            <VueSelect name="taskAdd" :options="options" label="title" v-model="selectedGoal" :append-to-body="true"></VueSelect>
        </div>
        <div class="editor">
            <input type="text" id="Name" name="Name" placeholder="タイトル" v-model="title">
        </div>
        <div class="editor">
            <mavon-editor language="ja" :toolbars="markdownOption" v-model="description" />
        </div>
        <div class="time-list">
            <div class="item">
                <p class="inputTitle">開始日</p>
                <DatePicker isStart=true />
            </div>
            <div class="item">
                <p class="inputTitle">終了日</p>
                <DatePicker isStart=false />
            </div>
        </div>
        <div class="relationImages">
            <p class="inputTitle">関連画像</p>
            <DropFile @change="onFileChange"/>
        </div>
        <div class="relationImages">
            <button class="registerButton" @click="register">登録する</button>
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
            markdownOption: {
                bold: true,
                italic: true,
                header: true,
                underline: true,
                strikethrough: true,
                mark: false,
                superscript: false,
                subscript: false,
                quote: true,
                ol: true,
                ul: true,
                link: true,
                imagelink: false,
                code: true,
                table: true,
                fullscreen: false,
                readmodel: true,
                htmlcode: true,
                help: true,
                undo: true,
                redo: true,
                trash: false,
                save: false,
                navigation: false,
                alignleft: false,
                aligncenter: false,
                alignright: false,
                subfield: true,
                preview: true
            },
            title: '',
            description: '',
            selectedGoal: '',
            options: [],
            startDate: '',
            endDate: '',
            files: []
        };
    },
    components: {
        DatePicker,
        DropFile,
    },
    mounted() {
        this.getGoals()
    },
    methods: {
        async getGoals() {
            try {
                const res = await axios.get(import.meta.env.VITE_APP_API_BASE + '/myGoals', {
                    headers:{
                        'Content-Type': 'application/json',
                        'access-token' : Cookies.get('accessToken'),
                        'client':Cookies.get('client'),
                        'uid': Cookies.get('uid')
                    }
                })
                for(let item of res.data.goal){
                    this.options.push(item);
                }
            } catch (error) {
                console.log({ error })
            }
        },
        async register() {
        },
        onFileChange(event) {
            for (let file of event) {
                this.files.push(file);
            }
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
.registerButton{
    background: #ffa500;
    color: white;
    font-size:16px;
    font-weight:bold;
}
</style>
