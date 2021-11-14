import axios from 'axios'

import { StockURLs } from '../enum/stock.enum'
import { SearchParams, Deatilparam } from '../interface/stock-interface';


axios.defaults.baseURL = 'http://localhost:3000/'

export const RequestSeacrh = async (paramObj: SearchParams) => {
    return await axios.get(StockURLs.searchUrl, { params: paramObj });
}

export const RequestList = async () => {
    return await axios.get(StockURLs.getListUrL)
}
export const RequestDetail = async (param: Deatilparam) => {
    return await axios.get(StockURLs.detailUrl, { params: param });
}