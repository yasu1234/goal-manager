<script>
import axios from 'axios';
import Cookies from 'js-cookie'

export default {
    data() {
        return {
            isLoggedIn: false,
            image: null,
            isDropdownOpen: false,
        };
    },
    mounted() {
        this.checkLoggedIn();
    },
    computed: {},
    methods: {
        checkLoggedIn() {
            const response = axios.get(import.meta.env.VITE_APP_API_BASE + '/current_user', {
                headers: {
                    'Content-Type': 'application/json',
                    'access-token' : Cookies.get('accessToken'),
                    'client':Cookies.get('client'),
                    'uid': Cookies.get('uid')
                }
            })
            .then(response => {
                if (response.data) {
                    this.isLoggedIn = response.data.isLogin;
                    this.image = response.data.image;
                }
            })
            .catch(error => {
                this.isLoggedIn = false;
            });
        },
        toggleDropdown() {
            this.isDropdownOpen = !this.isDropdownOpen;
        },
        showHome() {
            this.$router.push('/');
        },
    }, 
};
</script>

<template>
  <header id="header">
  <div class="inner">
    <img src="../assets/image/show_home.svg" alt="Logo" class= "showHomeImage" @click="showHome">
  </div>
  <div class="userMenu">
    <img v-if="image" :src="image" />
    <img v-else src="../assets/image/user.svg" class= "userPlaceholder" @click="toggleDropdown()"/>
    <ul v-if="isLoggedIn && isDropdownOpen" class="dropdownMenu">
        <li>設定</li>
        <li>ログアウト</li>
    </ul>
  </div>
</header>
</template>

<style>
header {
  position: fixed;
  /* z-index: 999; */
  top: 0;
  left: 0;
  width: 100%;
  padding: 10px 20px;
  background: #fbd8b5;
  box-sizing: border-box;
  display: flex;
}
.showHomeImage {      
    width:35px;
    height:35px;
    object-fit: cover;
    display: block;
}
.userMenu {      
    margin:0 0 0 auto;
    position: relative;
}
.userPlaceholder {      
    width:35px;
    height:35px;
    object-fit: cover;
    display: block;
    border: 1px solid #000;
    border-radius: 50%;
    cursor: pointer;
}
.dropdownMenu {
  position: absolute; /* ドロップダウンメニューの絶対的な位置指定に使用 */
  top: 100%; /* メニューを親要素から下方向に表示 */
  right: 0; /* メニューを親要素から右端に表示 */
  padding: 10px;
  background: #fff;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
  list-style: none;
  width: 100px;
}
.dropdownMenu li {
  padding-top: 10px;
  padding-bottom: 5px;
  border-bottom: 1px solid #ccc;
}
.dropdownMenu li:last-child {
  border-bottom: none;
}
</style>