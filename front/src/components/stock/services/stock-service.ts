import { axiosGet } from '../../../api/axios'
import { StockURLs } from './stock-url.enum'
import { SearchParams } from './stock-interface';

export const SeacrhFn = async (param: SearchParams) => {
    return await axiosGet(StockURLs.searchUrl, param);
 }
