{if isset($EVERYPAY_STANDALONE) && $EVERYPAY_STANDALONE}
    {assign var="pageform" value="1"}
{else}
    {assign var="pageform" value="0"}  
{/if}
<script type="text/javascript">

</script>
{if $pageform}
    <div class="everypayform__standalone_wrapper">
        {if $EVERYPAY_MSG}
            <div class="warning">{$EVERYPAY_MSG}</div><br />    
        {/if}
    {/if}

    {if !($EVERYPAY_CUSTOMER_MODE && !is_null($EVERYPAY_CARDS) && $EVERYPAY_CARDS|count>0 && !$isGuest)}
        <!-- the form with no remember -->
        <div class="payment_module everypay-buttton-wrapper">
            <form class="everypay-button-form" method="POST" action="{$EVERYPAY_FORM_ACTION}" id="opc-form">
                <p class="payment_module">                    
                    <img height="49px" alt="{l s='Pay with your credit card' mod='everypay_prestashop_1_4_x'}" src="{$module_template_dir}assets/images/everypay_select_o.jpg">            
                    {l s='Pay with your credit card' mod='everypay_prestashop_1_4_x'}                    
                </p>
                <br />
                <div class="button-holder"></div>
                {if ($EVERYPAY_CUSTOMER_MODE && !$isGuest)}           
                    <p class="everypay_button_save_card">
                        <input id="remember_ev_card" type="checkbox" name="remember_card" />
                        <label for="remember_ev_card">{l s='Save this card for use in the future?' mod='everypay_prestashop_1_4_x'}
                            <br />
                            <small>{l s='Your card details don\'t get really stored. A unique token gets saved instead.' mod='everypay_prestashop_1_4_x'}</small> </label>
                    </p>
                {/if}
            </form>
        </div>
    {else}
        <div class="payment_module everypay-buttton-wrapper">
            <div class="everypay-button-form">
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

        <div class="everypay_selection_wrapper_new_card on_the_right" {if $EVERYPAY_CUSTOMER_MODE && !is_null($EVERYPAY_CARDS) && $EVERYPAY_CARDS|count>0 && !$isGuest}style="display:none"{/if}>
            <form class="everypay-button-form" method="POST" action="{$EVERYPAY_FORM_ACTION}" id="opc-form">

                <div class="button-holder"></div>             
                {if ($EVERYPAY_CUSTOMER_MODE && !$isGuest)}           
                    <p class="everypay_button_save_card">
                        <input id="remember_ev_card" type="checkbox" name="remember_card" />
                        <label for="remember_ev_card">{l s='Save this card for use in the future?' mod='everypay_prestashop_1_4_x'}
                            <br />
                            <small>{l s='Your card details don\'t get really stored. A unique token gets saved instead.' mod='everypay_prestashop_1_4_x'}</small>
                        </label>
                    </p>
                {/if}
            </form>        
        </div>

        <script type="text/javascript">
            //<![CDATA[
            $(document).ready(function () {
                bindOldVSNewSelector();
            }); //]]>
        </script>
    {/if}

    {if $pageform}
        <p class="cart_navigation">
            <a href="{$link->getPageLink('order.php', true)}?step=3" class="button_large">{l s='Other payment methods' mod='everypay_prestashop_1_4_x'}</a>
        </p>
    </div>{/if}

    <script type="text/javascript">
        //<![CDATA[        
        var EVERYPAY_OPC_BUTTON = {
            amount: {$amountInteger},
            description: "{$description}",
            key: "{$EVERYPAY_CONFIGURATION.EVERYPAY_PUBLIC_KEY}",
            locale: "{$locale}",
            callback: 'handleTokenResponse'
        }
        var $everypayForm;
        var MSG_PLEASE_WAIT = '{l s='Submitting' mod='everypay_prestashop_1_4_x'}';

        $(document).ready(function () {
            $everypayForm = $('#opc-form');
            setTimeout(function () {
                EverypayButton.jsonInit(EVERYPAY_OPC_BUTTON, $everypayForm);
            }, 1000);
        });
        //]]>
    </script>

