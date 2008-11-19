# Rails 2.0 dependent code

module ActiveRecord
  module ConnectionAdapters
    class PostgreSQLAdapter
      def client_min_messages_with_quote=(level)
        client_min_messages_without_quote = h(level).untaint
      end
      alias_method_chain(:client_min_messages=, :quote)

      def last_insert_id_with_quote(table, sequence_name)
        last_insert_id_without_quote(table, h(sequence_name).untaint)
      end
      alias_method_chain(:last_insert_id, :quote)
    end
  end
end
