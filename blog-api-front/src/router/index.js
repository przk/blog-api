import Vue from 'vue'
import Router from 'vue-router'
import MainPage from '@/components/MainPage'
import Signin from '@/components/Signin'
import Signup from '@/components/Signup'
import Page from '@/components/Page'
import ErrNotFound from '@/components/ErrNotFound'
import Comments from '@/components/Comments'
import NewPage from '@/components/NewPage'
import EditPage from '@/components/EditPage'
import AdminPanel from '@/components/AdminPanel'
import AdminPanelUsers from '@/components/AdminPanelUsers'
import AdminPanelPages from '@/components/AdminPanelPages'
import AdminPanelPage from '@/components/AdminPanelPage'
import AdminPanelUser from '@/components/AdminPanelUser'
import EditUser from '@/components/EditUser'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'MainPage',
      component: MainPage
    },
    {
      path: '/page/:pageId',
      name: 'Page',
      component: Page
    },
    {
      path: '/newpage',
      name: 'newPage',
      component: NewPage
    },
    {
      path: '/editpage/:pageId',
      name: 'editPage',
      component: EditPage
    },
    {
      path: '/page/:pageId/comments/',
      name: 'Comments',
      component: Comments
    },
    {
      path: '/signin',
      name: 'Signin',
      component: Signin
    },
    {
      path: '/signup',
      name: 'Signup',
      component: Signup
    },
    {
      path: '/404',
      name: 'ErrNotFound',
      component: ErrNotFound
    },
    {
      path: '/panel',
      name: 'AdminPanel',
      component: AdminPanel
    },
    {
      path: '/panel/users',
      name: 'AdminPanelUsers',
      component: AdminPanelUsers
    },
    {
      path: '/panel/pages',
      name: 'AdminPanelPages',
      component: AdminPanelPages
    },
    {
      path: '/panel/pages/:pageId',
      name: 'AdminPanelPage',
      component: AdminPanelPage
    },
    {
      path: '/panel/users/:userId',
      name: 'AdminPanelUser',
      component: AdminPanelUser
    },
    {
      path: '/edituser',
      name: 'EditUser',
      component: EditUser
    }
  ]
})
