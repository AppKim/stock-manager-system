export interface SearchParams {
    type: string;
    query: string;
}

export interface Deatilparam {
    st_pr_id: number
}

export interface IStockModel {
    st_pr_id: number
    pr_ca_id: number
    br_name: string
    pr_price: number
    count: number
}

export interface IStockDetailModel {
    st_pr_id: number
    pr_ca_id: number
    br_name: string
    pr_price: string
    pr_expiration: string
    count: number
}

export interface IResponse<T> {
    config: any
    data: Array<T>
    headers: any
    request: XMLHttpRequest
    status: number
    statusText: string
}