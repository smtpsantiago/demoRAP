CLASS zcl_rap_eml_jb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_jb IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
**        step 1
*    read ENTITIES OF ZI_RAP_Travel_JB
*        ENTITY Travel
*            from VALUE #( ( TravelUUID = '324500C0E4B44E02190094000B1614FC' ) )
*        RESULT data(travels).
*
*    out->write( travels ).

* " step 2 - READ with Fields
*    READ ENTITIES OF ZI_RAP_Travel_JB
*      ENTITY travel
*        FIELDS ( AgencyID CustomerID )
*      WITH VALUE #( ( TravelUUID = '324500C0E4B44E02190094000B1614FC' ) )
*      RESULT DATA(travels).
*    out->write( travels ).

*    " step 3 - READ with All Fields
*    READ ENTITIES OF ZI_RAP_Travel_JB
*      ENTITY travel
*        ALL FIELDS
*      WITH VALUE #( ( TravelUUID = '324500C0E4B44E02190094000B1614FC' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).

*    " step 4 - READ By Association
*    READ ENTITIES OF ZI_RAP_Travel_JB
*      ENTITY travel BY \_Booking
*        ALL FIELDS WITH VALUE #( ( TravelUUID = '324500C0E4B44E02190094000B1614FC' ) )
*      RESULT DATA(bookings).
*
*    out->write( bookings ).

*     " step 5 - Unsuccessful READ
*     READ ENTITIES OF ZI_RAP_Travel_JB
*       ENTITY travel
*         ALL FIELDS WITH VALUE #( ( TravelUUID = '11111111111111111111111111111111' ) )
*       RESULT DATA(travels)
*       FAILED DATA(failed)
*       REPORTED DATA(reported).
*
*     out->write( travels ).
*     out->write( failed ).    " complex structures not supported by the console output
*     out->write( reported ).  " complex structures not supported by the console output

*  " step 6 - MODIFY Update
*     MODIFY ENTITIES OF ZI_RAP_Travel_JB
*       ENTITY travel
*         UPDATE
*           SET FIELDS WITH VALUE
*             #( ( TravelUUID  = '324500C0E4B44E02190094000B1614FC'
*                  Description = 'I like RAP@openSAP' ) )
*
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
*     out->write( 'Update done' ).
*
*          " step 6b - Commit Entities
*     COMMIT ENTITIES
*       RESPONSE OF ZI_RAP_Travel_JB
*       FAILED     DATA(failed_commit)
*       REPORTED   DATA(reported_commit).

*    " step 7 - MODIFY Create
*    MODIFY ENTITIES OF ZI_RAP_Travel_JB
*      ENTITY travel
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*               "  CustomerID  = '14'
*                CustomerID  = '728'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'I like RAP@openSAP' ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_Travel_JB
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

    " step 8 - MODIFY Delete
    MODIFY ENTITIES OF ZI_RAP_Travel_JB
      ENTITY travel
        DELETE FROM
          VALUE
            #( ( TravelUUID  = '5d1c4266-2989-1edf-8c83-3684aab6baac' ) )

     FAILED DATA(failed)
     REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF ZI_RAP_Travel_JB
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Delete done' ).

  ENDMETHOD.

ENDCLASS.
