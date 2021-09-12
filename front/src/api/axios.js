import axios from "axios"

axios.defaults.baseURL = "http://localhost:3000/"

export const axiosGet = (path, param) => {
  const requestURL = "/" + path + (param ? "/" + param : "")
  return axios.get(requestURL)
}

export const axiosPost = (path, param) => {
  console.log(param)
  const requestURL = path
  return axios.post(requestURL, param)
}

export const axiosPut = (path, id, param) => {
  const requestURL = "/" + path + (id ? "/" + id : "")
  return axios.put(requestURL, param)
}

export const axiosDelete = (path, param) => {
  console.log(param)
  const requestURL = "/" + path + (param ? "/" + param : "")
  return axios.delete(requestURL)
}
