import axios from "axios";

axios.defaults.baseURL = "http://localhost:3000/";

export const axiosGet = (path, param) => {
  const requestURL = "/" + path + (param ? "/" + param : "");
  return axios.get(requestURL);
};

export const axiosPost = (path, param) => {
  const requestURL = path;
  return axios.post(requestURL, param);
};
