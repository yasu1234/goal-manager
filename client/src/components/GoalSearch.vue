<template>
    <v-app>
        <Search @onSearch="setSearchParam"/>
        <GoalList :searchResult= searchResult :totalPageCount= totalPageCount @changePage="changePage" />
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
            isShowCompleteGoal: false,
            totalPageCount: 0,
            page: 1,
            perPageCount: 50,
        };
    },
    components: {
        Search,
        GoalList
    },
    mounted() {
    },
    methods: {
        setSearchParam(data) {
            this.keyword = data.keyword;
            this.selected = data.selectedCategory;
            this.startDate = data.startDate;
            this.endDate = data.endDate;
            this.isMyGoal = data.isMyGoal;
            this.isShowCompleteGoal = data.isShoowCompleteGoal;

            this.search()
        },
        async search() {
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
                        perPageCount: this.perPageCount
                    }
                })

                this.searchResult.splice(0);

                for(let item of res.data.goals){
                    this.searchResult.push(item);
                }

                this.totalPageCount = res.data.totalCount / 5 + 1;

                if (this.page > 1) {
                    this.$router.push( {path: '/goalSearch', query: {page: this.page}});
                } else {
                    this.$router.push( {path: '/goalSearch'});
                }

            } catch (error) {
                console.log({ error })
            }
        },
        changePage(page) {
            this.page = page
            this.search()
        }
    }
}
</script>

<style>
</style>