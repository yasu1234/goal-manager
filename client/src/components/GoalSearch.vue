<template>
    <v-app>
        <Search @onSearch="search"/>
        <GoalList :searchResult= searchResult />
    </v-app>
</template>

<script>
import Search from '../components/Search.vue'
import GoalList from '../components/GoalList.vue'
import axios from 'axios';
import Cookies from 'js-cookie';

export default {
    data() {
        return {
            keyword: '',
            selected: '',
            searchResult: [],
            startDate: '',
            endDate: '',
            isMyGoal: false,
            isShowCompleteGoal: false
        };
    },
    components: {
        Search,
        GoalList
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

                for(let item of res.data.goals){
                    this.searchResult.push(item);
                }
            } catch (error) {
                console.log({ error })
            }
        },
    }
}
</script>

<style>
</style>