export default {
    state: {
      user: "", // 登录的用户
      showNeed: false // 用于控制是否显示登录组件
    },
    getters: {
      getUser (state) {
        return state.user
      },
      getShowNeed (state) {
        return state.showNeed
      }
    },
    mutations: {
      setNeed (state, data) {
        state.user = data;
      },
      setShowNeed (state, data) {
        state.showNeed = data;
      }
    },
    actions: {
      setUser ({ commit }, data) {
        commit('setUser', data);
      },
      setShowNeed ({ commit }, data) {
        commit('setShowNeed', data);
      }
    }
  }