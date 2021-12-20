export type Product = {
  pr_id: number
  pr_name: string
  pr_ca_id: number
  pr_br_id: number
  pr_us_id: number
  pr_price: string
  pr_barcode: string
  pr_img: string
}

export type UpdateProduct = Partial<Product>

export type ProductSearchParams = {
  pr_name?: string
  pr_ca_id?: number
  pr_br_id?: number
  pr_us_id?: number
}
