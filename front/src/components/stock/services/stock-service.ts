import axios from 'axios'

import { StockURLs } from '../enum/stock.enum'
import { SearchParams, Deatilparam, IResponse, IStockModel, IStockDetailModel } from '../interface/stock-interface';


axios.defaults.baseURL = 'http://localhost:3000/'

export const RequestSeacrh = async (paramObj: SearchParams): Promise<IResponse<IStockModel>> => {
    return await axios.get(StockURLs.searchUrl, { params: paramObj });
}

export const RequestList = async (): Promise<IResponse<IStockModel>> => {
    return await axios.get(StockURLs.getListUrL)
}
export const RequestDetail = async (param: Deatilparam): Promise<IResponse<IStockDetailModel>> => {
    return await axios.get(StockURLs.detailUrl, { params: param });
}
