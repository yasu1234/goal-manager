<script>
export default {
}
</script>

<template>
 <div>
    <img src="../assets/image/home_image.jpg" alt="Logo" class= "homeLogo">
    <h1>心の中に留めるだけでいいのか？<br>目標を管理・共有しよう</h1>
    <div class="homeButtons">
        <button class="commonButton">会員登録</button>
        <button class="commonButton">ログイン</button>
        <button class="guestButton">ゲストログイン</button>
    </div>
 </div>
</template>

<style>
.homeLogo {      
    width:100%;
    height:400px;
    object-fit: cover;
    display: block;
}
.homeButtons {
    width:50%;
    display: flex;
    flex-direction: column;
    margin-left: auto;
    margin-right: auto;
}
.homeButtons button {
    margin-top: 20px;
}
.commonButton {
    background-color: #ffa500;
}
.guestButton {
    background-color: #f75549;
}
</style>