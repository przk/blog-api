import axios from 'axios'

const API_URL = 'http://0.0.0.0:3000/api/v1/'

const securedAxiosInstance = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json'
  }
})

const plainAxiosInstance = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json'
  }
})

securedAxiosInstance.interceptors.request.use(config => {
  config.headers = {
    ...config.headers,
    'Authorization': 'Basic ' + localStorage.csrf
  }
  return config
})

export { securedAxiosInstance, plainAxiosInstance }
