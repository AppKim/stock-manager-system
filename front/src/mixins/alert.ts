import Vue from 'vue'

export default Vue.extend({
  // TODO: 型をどう読み込ませればいい？
  data() {
    return {
      $swal: {},
    }
  },
  methods: {
    // // OKのみ
    // /**
    //  * 完了と問題用のボタン一つのアラート
    //  * @param TypeAlert success または error を選んでください [success: 確認, error: 問題]
    //  * @param AlertTitle Top title
    //  * @param AlertText Alert Content
    //  */
    // mixinAlert(TypeAlert: string, AlertTitle: string, AlertText: string): Promise<boolean> {
    //   return this.$swal({
    //     icon: TypeAlert,
    //     title: AlertTitle,
    //     html: `<div class="px-3 pb-1 text-base">${AlertText}</div>`,
    //     width: 420,
    //     confirmButtonText: this.$t('alert.confirmButton') as string,
    //     position: 'center',
    //     buttonsStyling: true,
    //     allowOutsideClick: false,
    //     allowEscapeKey: false,
    //     allowEnterKey: false,
    //     showClass: {
    //       popup: 'swal2-dropdown-forward',
    //       icon: 'swal2-noanimation',
    //     },
    //     hideClass: {
    //       popup: 'swal2-hide-reverse',
    //     },
    //     customClass: {
    //       title: 'text-xl',
    //       container: 'alert',
    //       popup: 'alert-popup alert-popup--alert',
    //       confirmButton: 'px-8 py-2 swal2-bg-confirm text-white rounded-md alert-button',
    //       content: 'font-light',
    //     },
    //   }).then((result: { key: string; value: boolean }) => {
    //     return !!result.value
    //   })
    // },

    // Note: OK と キャンセル
    /**
     * 確認用のアラート
     * @param ConfirmTitle Top Title
     * @param ContentText Content Text, it can be html
     */
    mixinConfirm(ConfirmTitle: string, ContentText: string, ConfirmBtn = '확인', CancelBtn = '취소'): Promise<boolean> {
      return this.$swal({
        title: ConfirmTitle,
        text: ContentText,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: ConfirmBtn,
        cancelButtonText: CancelBtn,
        showCloseButton: true,
        showLoaderOnConfirm: true,
      }).then((result: { key: string; value: boolean }) => {
        return !!result.value
      })
    },

    // // Note: Delete Confirm alert
    // /**
    //  * 削除確認用のアラート
    //  * @param DeleteTargetName Target Name, it can be html
    //  * @param DeleteTitle (Optional) Top Title
    //  * @param AlertText (Optional) Alert Text, it can be html
    //  */
    // mixinDeleteAlert(
    //   DeleteTargetName: string,
    //   DeleteTitle: string = this.$t('alert.deleteTitle') as string,
    //   AlertText: string = this.$t('alert.warningText') as string,
    // ): Promise<boolean> {
    //   return this.$swal({
    //     icon: 'warning',
    //     width: 500,
    //     title: DeleteTitle,
    //     cancelButtonText: this.$t('alert.cancelButton') as string,
    //     confirmButtonText: this.$t('alert.runButton') as string,
    //     html:
    //       `<div class="mt-4 p-3 text-black-dark bg-badge-bg">${DeleteTargetName}</div>` +
    //       `<div class="pt-3 text-btnColor-red">${AlertText}</div>`,
    //     position: 'center',
    //     buttonsStyling: false,
    //     showCancelButton: true,
    //     allowOutsideClick: false,
    //     allowEscapeKey: false,
    //     allowEnterKey: false,
    //     showClass: {
    //       popup: 'swal2-dropdown-forward',
    //     },
    //     hideClass: {
    //       popup: 'swal2-hide-reverse',
    //     },
    //     customClass: {
    //       popup: 'alert-popup alert-popup--alert',
    //       container: 'alert',
    //       confirmButton: 'py-2 swal2-bg-confirm text-white rounded-md alert-button',
    //       cancelButton: 'py-2 mr-2 swal2-bg-cancel text-white rounded-md alert-button',
    //     },
    //   }).then((result: { key: string; value: boolean }) => {
    //     return !!result.value
    //   })
    // },

    // // Note: 通知のみ
    // mixinToast(toastText: string): void {
    //   this.$swal({
    //     toast: true,
    //     text: toastText,
    //     position: 'top',
    //     timer: 1440,
    //     showConfirmButton: false,
    //   })
    // },
  },
})
