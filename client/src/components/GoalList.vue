<template>
    <v-app>
        <div class="goalListCard" v-for="item of searchResult" :key="item.id">
            <h4><b>{{ item.title }}</b></h4>
            <div class="container">
                <p>{{ item.startDate }}</p>~<p>{{ item.endDate }}</p>
            </div>
        </div>
    </v-app>
</template>

<script>
import "vue-select/dist/vue-select.css";

export default {
    data() {
        return {
        };
    },
    components: {
    },
    props: ['searchResult'],
    mounted() {
    },
    methods: {
    }
}
</script>

<style>
.goalListCard{
   margin: 10px 12px 12px 12px;
   border: 1px solid #CCC;
   border-radius: 5px;
 }

 input[type=text] {
  width: 100%;
  padding: 12px 12px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 1px solid #ccc;
  border-radius: 4px;
}
.relationImages {
    padding: 20px;
}

</style>
