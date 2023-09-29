<template>
    <VueDatePicker
    v-model="date"
    locale="ja"
    week-start="0"
    format="yyyy/M/d"
    auto-apply
    :month-change-on-scroll="false"
    :enable-time-picker="false"
    @update:model-value="updateDate"/>
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
            if (this.date == null) {
                if (this.isStart == "true") {
                    this.$emit('startDateChange', '');
                } else {
                    this.$emit('endDateChange', '');
                }
                return;
            }

            const formattedDate = format(this.date, 'yyyy/MM/dd');

            if (this.isStart == "true") {
                this.$emit('startDateChange', formattedDate);
            } else {
                this.$emit('endDateChange', formattedDate);
            }
        }
    }
}
</script>

<style>
</style>
