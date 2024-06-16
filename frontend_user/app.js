// app.js
import {
  asyncGetStorage
} from './utils/storage'
import {
  promisifyAll
} from 'miniprogram-api-promise'

const wxp = wx.p = {}
promisifyAll(wx, wxp)

App({
 

  async checkToken() {
    asyncGetStorage('token').then((token) => {
      if (!token.data) {
        wx.reLaunch({
          url: '/pages/login/login',
        });
      }
    });
  },

  onLaunch: function () {
    this.checkToken()
  },
})