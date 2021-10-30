import axios from 'axios'

import { StockURLs } from '../enum/stock.enum'
import { SearchParams } from '../interface/stock-interface';


axios.defaults.baseURL = 'http://localhost:3000/'

export const SeacrhFn = async (param: SearchParams) => {
    return await axios
        .get(StockURLs.searchUrl, { params: param });
}
