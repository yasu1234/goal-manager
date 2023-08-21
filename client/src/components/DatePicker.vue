<template>
    <VueDatePicker
    v-model="date"
    locale="ja"
    week-start="0"
    format="yyyy/M/d"
    auto-apply
    :month-change-on-scroll="false"
    :enable-time-picker="false"
    @update:model-value="updateDate" />
</template>

<script>
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';
import { format } from 'date-fns';

export default {
    data() {
        return {
            date: null
        };
    },
    props: ['isStart'],
    components: {
        VueDatePicker
    },
    methods: {
        updateDate() {
            const formattedDate = format(this.date, 'yyyy/M/d');

            if (this.isStart) {
                this.$parent.startDate = formattedDate;
            } else {
                this.$parent.endDate = formattedDate;
            }
        }
    }
}
</script>

<style>
</style>
