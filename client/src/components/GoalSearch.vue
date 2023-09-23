<template>
    <v-app>
        <Search @onSearch="search"/>
    </v-app>
</template>

<script>
import Search from '../components/Search.vue'
import "vue-select/dist/vue-select.css";
import axios from 'axios';
import Cookies from 'js-cookie';

export default {
    data() {
        return {
            keyword: '',
            selected: '',
            options: [],
            startDate: '',
            endDate: '',
            isMyGoal: false,
            isShowCompleteGoal: false
        };
    },
    components: {
        Search
    },
    mounted() {
    },
    methods: {
        async search(data) {
            this.keyword = data.keyword;
            this.selected = data.selectedCategory;
            this.startDate = data.startDate;
            this.endDate = data.endDate;
            this.isMyGoal = data.isMyGoal;
            this.isShowCompleteGoal = data.isShoowCompleteGoal;

            try {
                const res = await axios.get(import.meta.env.VITE_APP_API_BASE + '/goals', {
                    headers: {
                        'access-token' : Cookies.get('accessToken'),
                        'client':Cookies.get('client'),
                        'uid': Cookies.get('uid'),
                    },
                    params: {
                        keyWord: this.keyword,
                        isMyGoal: this.isMyGoal,
                        startDate: this.startDate,
                        endDate: this.endDate,
                    }
                })
                console.log(res.data);
            } catch (error) {
                console.log({ error })
            }
        },
    }
}
</script>

<style>
</style>