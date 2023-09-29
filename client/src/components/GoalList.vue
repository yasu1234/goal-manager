<template>
    <v-app>
        <div class="goalListCard" v-for="item of searchResult" :key="item.id">
            <h4 class="goalTitle"><b>{{ item.title }}</b></h4>
            <div class="container">
                <p class="goalDate">{{ item.startDate }}~{{ item.endDate }}</p>
            </div>
        </div>
        <v-pagination
        v-if="searchResult.length"
        v-model="page"
        class="my-4"
        :length=totalPageCount
        @update:modelValue="handlePageChange" />
    </v-app>
</template>

<script>
export default {
    data() {
        return {
            page: 1,
        };
    },
    components: {
    },
    props: ['searchResult', 'totalPageCount'],
    mounted() {
    },
    methods: {
        handlePageChange(newPageNumber) {
            this.$emit('changePage', newPageNumber)
        }
    }
}
</script>

<style>
.goalListCard{
    margin: 10px 12px 12px 12px;
    border: 1px solid #CCC;
    border-radius: 5px;
}
.goalTitle{
    margin: 10px 12px 12px 10px;
}
.goalDate{
    margin: 10px 0px 10px 10px;
}
</style>
