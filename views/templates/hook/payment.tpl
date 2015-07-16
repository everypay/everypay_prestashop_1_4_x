{if isset($EVERYPAY_STANDALONE) && $EVERYPAY_STANDALONE}
    {assign var="pageform" value="1"}
{else}
    {assign var="pageform" value="0"}  
{/if}

{if $pageform}
    <div class="everypayform__standalone_wrapper">
        {if $EVERYPAY_MSG}
            <div class="warning">{$EVERYPAY_MSG}</div><br />    
        {/if}
    {/if}


    {if !($EVERYPAY_CUSTOMER_MODE && !is_null($EVERYPAY_CARDS) && $EVERYPAY_CARDS|count>0 && !$isGuest)}
        <p class="payment_module">
            <a title="{l s='Pay with your credit card' mod='everypay_prestashop_1_4_x'}" id="everypay_process_payment" href="#everypay-payment-form" onclick="return false;">
                <img height="49px" alt="{l s='Pay with your credit card' mod='everypay_prestashop_1_4_x'}" src="{$module_template_dir}assets/images/everypay_select_o.jpg">            
                {l s='Pay with your credit card' mod='everypay_prestashop_1_4_x'}
            </a>
        </p>
    {else}
        <div class="payment_module everypay-buttton-wrapper">
            <div class="everypay-button-form"">
                <div class="payment_module">                    
                    <img height="49px" alt="{l s='Pay with your credit card' mod='everypay_prestashop_1_4_x'}" src="{$module_template_dir}assets/images/everypay_select_o.jpg">            
                    <div class="everypay_cardway_selection">
                        {l s='Pay with:' mod='everypay_prestashop_1_4_x'}   
                        <input type="radio" id="select_saved_card" value="saved_card" name="everypay_cardway" checked="checked"><label for="select_saved_card">{l s='Saved Card' mod='everypay_prestashop_1_4_x'}</label>
                        <input type="radio" id="select_new_card" value="new_card" name="everypay_cardway"><label for="select_new_card">{l s='New card' mod='everypay_prestashop_1_4_x'}</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="everypay_selection_wrapper_saved_card">
            {$EVERYPAY_CARD_SELECTION}
        </div>        
    {/if}

    <div class="everypay_selection_wrapper_new_card" {if $EVERYPAY_CUSTOMER_MODE && !is_null($EVERYPAY_CARDS) && $EVERYPAY_CARDS|count>0 && !$isGuest}style="display:none"{/if}>
        <form action="{$EVERYPAY_FORM_ACTION}" method="POST" id="everypay-payment-form" class="everypay_form add-everypay-card-form" >
            <p class="required text">
                <label for="card-number">{l s='Card Number' mod='everypay_prestashop_1_4_x'} <sup>*</sup></label>
                <input type="text" maxlength="16" autocomplete="off" id="card-number" data-card="card_number" placeholder="XXXX-XXXX-XXXX-XXXX" value="" class="text">
            </p>   

            <p class="select">
                <span>{l s='Expiration' mod='everypay_prestashop_1_4_x'} <sup>*</sup></span> 
                <select id="card-month" data-card="expiration_month">
                    <option value="0">{l s='Month' mod='everypay_prestashop_1_4_x'}</option>
                    {for $foo=1 to 12}
                        <option value="{$foo}">&nbsp;{$foo|str_pad:2:"0":$smarty.const.STR_PAD_LEFT}</option>
                    {/for}
                </select>
                <select id="card-year" data-card="expiration_year">
                    <option value="0">{l s='Year' mod='everypay_prestashop_1_4_x'}</option>
                    {for $foo=$smarty.now|date_format:'%Y' to ($smarty.now|date_format:'%Y')+8}
                        <option value="{$foo}">&nbsp;{$foo}</option>
                    {/for}
                </select>
            </p>

            <p class="required text">
                <label for="card-cvv">{l s='CVV' mod='everypay_prestashop_1_4_x'} <sup>*</sup></label>
                <input type="text" autocomplete="off" maxlength="3" id="card-cvv" data-card="cvv" placeholder="XXX" value="" class="text">
            </p>

            <p class="required text">
                <label for="card-name">{l s='Card Name' mod='everypay_prestashop_1_4_x'} <sup>*</sup></label>
                <input type="text" autocomplete="off" id="card-name" data-card="holder_name" placeholder="{l s='John Doe' mod='everypay_prestashop_1_4_x'}" value="" class="text">
            </p>

            <div class="submit-everypay">
                <div class="form-error" style="display:none"></div>
                {if ($EVERYPAY_CUSTOMER_MODE && !$isGuest)}           
                    <p>
                        <input id="remember_ev_card" type="checkbox" name="remember_card" />
                        <label for="remember_ev_card">{l s='Save this card for use in the future?' mod='everypay_prestashop_1_4_x'}
                            <br />
                            <small>{l s='Your card details don\'t get really stored. A unique token gets saved instead.' mod='everypay_prestashop_1_4_x'}</small> </label>
                    </p>
                {/if}
                <input type="submit" class="submit-payment exclusive button" value="{l s='Continue' mod='everypay_prestashop_1_4_x'}" />
            </div>
        </form>
    </div> <!-- new_selection_wrapper -->

    <script type="text/javascript">
        //<![CDATA[
        {literal}var $everypayForm = {};{/literal}
        Everypay.setPublicKey('{$EVERYPAY_CONFIGURATION.EVERYPAY_PUBLIC_KEY}');
        $(document).ready(function() {
            $everypayForm = $('#everypay-payment-form');
            $everypayForm.find('button, input, select').attr('disabled', false);
            bindEveryPayForm();
            bindOldVSNewSelector();
        });
        //]]>
    </script>

    {if $pageform}
        <p class="cart_navigation">
            <a href="{$link->getPageLink('order.php', true)}?step=3" class="button_large">{l s='Other payment methods' mod='everypay_prestashop_1_4_x'}</a>
        </p>
    </div>{/if}
