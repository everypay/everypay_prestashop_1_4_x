{if !is_null($EVERYPAY_CARDS) && $EVERYPAY_CARDS|count>0}
    <form action="{$EVERYPAY_FORM_ACTION}" id="select_everypay_saved_card" method="POST">
        <p class="select">
            <span>{l s='Select a saved card' mod='everypay_prestashop_1_4_x'}:</span> 
            <select name="cus_id" id="cust_ids" style='font-family:monospace'>
                {foreach from=$EVERYPAY_CARDS key=k item=v}
                    <option value="{$v['id_customer_token']}">&nbsp;&nbsp;{$v['card_type']|str_pad:14:".":$smarty.const.STR_PAD_RIGHT}{$v['card_last_four']}, 
                        {$v['exp_month']|str_pad:2:"0":$smarty.const.STR_PAD_LEFT}/{$v['exp_year']|substr:2:2}&nbsp;&nbsp;&nbsp;</option>
                {/foreach}
            </select>
        </p>
        <div class="submit-everypay">
            <input type="submit" name="submit_saved_card" class="submit_saved_card button" value="{l s='Continue' mod='everypay_prestashop_1_4_x'}" /> 
        </div>
    </form>
{/if}