module DCI
  class WalletTransfer
    include WalletContext

    def initialize(source, target)
      @source = source.extend(SourceWallet)
      @target = target.extend(TargetnWallet)
    end

    def transfer_money(amount)
      with_context do
        transaction do
          validate_rules

          # wallets can use some data and methods from context
          # like logging, transactions and etc
          @source.charge_money(amount)
          @source.get_money(amount)
        end

        notify
      end

      some_errors_handling
    end
  end
end
