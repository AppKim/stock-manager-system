import axios from "axios"

axios.defaults.baseURL = "http://localhost:3000/"

export const axiosGet = (path, param) => {
  const requestURL = "/" + path + (param ? "/" + param : "")
  return axios.get(requestURL)
}

export const axiosPut = (path, id, param) => {
  const requestURL = "/" + path + (id ? "/" + id : "")
  return axios.put(requestURL, param)
}
