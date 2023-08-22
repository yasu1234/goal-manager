<template>
    <v-app>
        <div class="editor">
            <input type="text" id="Name" name="Name" placeholder="タイトル">
        </div>
        <div class="editor">
            <mavon-editor language="ja" :toolbars="markdownOption"/>
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
            <DropFile/>
        </div>
        <div class="relationImages">
            <p class="inputTitle">カテゴリー</p>
            <VueSelect name="hoge" :options="options" label="name" v-model="selected" :append-to-body="true"></VueSelect>
        </div>
    </v-app>
</template>

<script>
import DatePicker from '../components/DatePicker.vue'
import DropFile from '../components/DropFile.vue'
import "vue-select/dist/vue-select.css";
import axios from 'axios';

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
            selected: '',
            options: [
            ],
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
        }
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
</style>
