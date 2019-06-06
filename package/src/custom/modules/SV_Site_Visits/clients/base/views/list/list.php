<?php
$module_name = 'SV_Site_Visits';
$viewdefs[$module_name] = 
array (
  'base' => 
  array (
    'view' => 
    array (
      'list' => 
      array (
        'panels' => 
        array (
          0 => 
          array (
            'label' => 'LBL_PANEL_DEFAULT',
            'fields' => 
            array (
              0 => 
              array (
                'name' => 'document_name',
                'label' => 'LBL_NAME',
                'link' => true,
                'default' => true,
                'enabled' => true,
              ),
              1 => 
              array (
                'name' => 'si_sites_sv_site_visits_1_name',
                'label' => 'LBL_SI_SITES_SV_SITE_VISITS_1_FROM_SI_SITES_TITLE',
                'enabled' => true,
                'id' => 'SI_SITES_SV_SITE_VISITS_1SI_SITES_IDA',
                'link' => true,
                'sortable' => false,
                'default' => true,
              ),
              2 => 
              array (
                'name' => 'date_of_travel_c',
                'label' => 'LBL_DATE_OF_TRAVEL',
                'enabled' => true,
                'default' => true,
              ),
              3 => 
              array (
                'name' => 'date_entered',
                'enabled' => true,
                'default' => false,
              ),
              4 => 
              array (
                'name' => 'date_modified',
                'enabled' => true,
                'default' => false,
              ),
              5 => 
              array (
                'name' => 'team_name',
                'label' => 'LBL_TEAM',
                'sortable' => false,
                'default' => false,
                'enabled' => true,
              ),
              6 => 
              array (
                'name' => 'modified_by_name',
                'label' => 'LBL_MODIFIED_USER',
                'module' => 'Users',
                'id' => 'USERS_ID',
                'default' => false,
                'sortable' => false,
                'related_fields' => 
                array (
                  0 => 'modified_user_id',
                ),
                'enabled' => true,
              ),
            ),
          ),
        ),
      ),
    ),
  ),
);
