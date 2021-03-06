FasdUAS 1.101.10   ��   ��    k             l      ��  ��   E?

This script extracts PDF highlights (eachHighlight) into a text file that can be imported into Anki. Separate Anki cards are delineated by a newline. Separate fields for the sides of cards can be indicated by a specified single-character separator (ideally "|"). 
Todo: build out something testable on the extracted text. E.g., use TFIDF to pick up keywords in a given extraction and use Skim's automation services to blank out the word(s) in the highlight. Then, append the words in order to the card using a second field. Scratch notes for this are commented out above.

     � 	 	~ 
 
 T h i s   s c r i p t   e x t r a c t s   P D F   h i g h l i g h t s   ( e a c h H i g h l i g h t )   i n t o   a   t e x t   f i l e   t h a t   c a n   b e   i m p o r t e d   i n t o   A n k i .   S e p a r a t e   A n k i   c a r d s   a r e   d e l i n e a t e d   b y   a   n e w l i n e .   S e p a r a t e   f i e l d s   f o r   t h e   s i d e s   o f   c a r d s   c a n   b e   i n d i c a t e d   b y   a   s p e c i f i e d   s i n g l e - c h a r a c t e r   s e p a r a t o r   ( i d e a l l y   " | " ) .   
 T o d o :   b u i l d   o u t   s o m e t h i n g   t e s t a b l e   o n   t h e   e x t r a c t e d   t e x t .   E . g . ,   u s e   T F I D F   t o   p i c k   u p   k e y w o r d s   i n   a   g i v e n   e x t r a c t i o n   a n d   u s e   S k i m ' s   a u t o m a t i o n   s e r v i c e s   t o   b l a n k   o u t   t h e   w o r d ( s )   i n   t h e   h i g h l i g h t .   T h e n ,   a p p e n d   t h e   w o r d s   i n   o r d e r   t o   t h e   c a r d   u s i n g   a   s e c o n d   f i e l d .   S c r a t c h   n o t e s   f o r   t h i s   a r e   c o m m e n t e d   o u t   a b o v e . 
 
   
  
 l     ��������  ��  ��        l     ����  r         m     ��
�� boovfals  o      ���� 	0 debug  ��  ��        l     ��������  ��  ��        l   h ����  O    h    k    g       I   ������
�� .miscactvnull��� ��� null��  ��        r        l    ����  1    ��
�� 
DTsl��  ��    o      ���� "0 selectedrecords selectedRecords     !   l    " # $ " r     % & % e     ' ' l    (���� ( n    ) * ) 4   �� +
�� 
cobj + m    ����  * o    ���� "0 selectedrecords selectedRecords��  ��   & o      ���� 0 targetrecord targetRecord # � { This script will only work on one document at a time for now. It should be trivial to expand it to work on a selected set.    $ � , , �   T h i s   s c r i p t   w i l l   o n l y   w o r k   o n   o n e   d o c u m e n t   a t   a   t i m e   f o r   n o w .   I t   s h o u l d   b e   t r i v i a l   t o   e x p a n d   i t   t o   w o r k   o n   a   s e l e c t e d   s e t . !  - . - Z     7 / 0���� / E     ' 1 2 1 l    % 3���� 3 c     % 4 5 4 n     # 6 7 6 1   ! #��
�� 
DTty 7 o     !���� 0 targetrecord targetRecord 5 m   # $��
�� 
TEXT��  ��   2 m   % & 8 8 � 9 9  P D F   D o c u m e n t 0 k   * 3 : :  ; < ; r   * - = > = o   * +���� 0 targetrecord targetRecord > o      ���� 0 	targetpdf 	targetPDF <  ?�� ? r   . 3 @ A @ n   . 1 B C B 1   / 1��
�� 
rURL C o   . /���� 0 targetrecord targetRecord A o      ���� 0 targetpdflink targetPDFLink��  ��  ��   .  D E D l  8 8��������  ��  ��   E  F G F l  8 8��������  ��  ��   G  H I H r   8 ? J K J n   8 ; L M L 1   9 ;��
�� 
tdta M o   8 9���� 0 	targetpdf 	targetPDF K o      ���� 0 thepdf thePDF I  N O N r   @ E P Q P o   @ A���� 0 targetpdflink targetPDFLink Q o      ���� 0 thelink theLink O  R S R r   F O T U T l  F K V���� V n   F K W X W 1   G K��
�� 
ppth X o   F G���� 0 	targetpdf 	targetPDF��  ��   U o      ���� 0 filepath filePath S  Y Z Y r   P Y [ \ [ l  P U ]���� ] n   P U ^ _ ^ 1   Q U��
�� 
UUID _ o   P Q���� 0 	targetpdf 	targetPDF��  ��   \ o      ���� 0 fileuuid fileUUID Z  ` a ` r   Z e b c b b   Z a d e d m   Z ] f f � g g  f i l e : / / e o   ] `���� 0 filepath filePath c o      ���� 0 filelink fileLink a  h�� h l  f f��������  ��  ��  ��    5    	�� i��
�� 
capp i m     j j � k k  D N t p
�� kfrmID  ��  ��     l m l l     ��������  ��  ��   m  n o n l  iB p���� p O   iB q r q k   oA s s  t u t I  o t������
�� .miscactvnull��� ��� null��  ��   u  v w v l  u u�� x y��   x  open the PDF in Skim    y � z z ( o p e n   t h e   P D F   i n   S k i m w  { | { r   u � } ~ } I  u |�� ��
�� .aevtodocnull  �    alis  o   u x���� 0 filepath filePath��   ~ o      ���� 0 thedocument theDocument |  � � � l  � ��� � ���   � : 4convert highlights in the opened PDF into Skim notes    � � � � h c o n v e r t   h i g h l i g h t s   i n   t h e   o p e n e d   P D F   i n t o   S k i m   n o t e s �  � � � I  � ��� ���
�� .SKIMConvnull���     docu � o   � ����� 0 thedocument theDocument��   �  � � � l  � ��� � ���   � @ :initialize a list to hold items for import into Anki cards    � � � � t i n i t i a l i z e   a   l i s t   t o   h o l d   i t e m s   f o r   i m p o r t   i n t o   A n k i   c a r d s �  � � � r   � � � � � J   � �����   � o      ���� 0 cardlist cardList �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �>8Main loop. Essentially, take every note in the Skim document (e.g., every highlight), get the text of the note, and find the paragraph containing that highlight. Replace the highlight inside the paragraph with a marked blank line. Finally, grab some info about the PDF file so that the paragraph is easy to find.    � � � �p M a i n   l o o p .   E s s e n t i a l l y ,   t a k e   e v e r y   n o t e   i n   t h e   S k i m   d o c u m e n t   ( e . g . ,   e v e r y   h i g h l i g h t ) ,   g e t   t h e   t e x t   o f   t h e   n o t e ,   a n d   f i n d   t h e   p a r a g r a p h   c o n t a i n i n g   t h a t   h i g h l i g h t .   R e p l a c e   t h e   h i g h l i g h t   i n s i d e   t h e   p a r a g r a p h   w i t h   a   m a r k e d   b l a n k   l i n e .   F i n a l l y ,   g r a b   s o m e   i n f o   a b o u t   t h e   P D F   f i l e   s o   t h a t   t h e   p a r a g r a p h   i s   e a s y   t o   f i n d . �  � � � X   �o ��� � � k   �j � �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � * $Identify the page of the given note.    � � � � H I d e n t i f y   t h e   p a g e   o f   t h e   g i v e n   n o t e . �  � � � r   � � � � � n   � � � � � 4  � ��� �
�� 
cobj � m   � ������� � l  � � ����� � I  � ��� ���
�� .SKIMPagsnull���     **** � o   � ����� 0 anote aNote��  ��  ��   � o      ���� 0 apage aPage �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � y sInitialize a list of the paragraphs. We will iterate through these to identify the highlight's enclosing paragraph.    � � � � � I n i t i a l i z e   a   l i s t   o f   t h e   p a r a g r a p h s .   W e   w i l l   i t e r a t e   t h r o u g h   t h e s e   t o   i d e n t i f y   t h e   h i g h l i g h t ' s   e n c l o s i n g   p a r a g r a p h . �  � � � r   � � � � � n   � � � � � 2  � ���
�� 
cpar � o   � ����� 0 apage aPage � o      ���� $0 listofparagraphs listOfParagraphs �  � � � r   � � � � � m   � �����   � o      ���� "0 paragraphnumber paragraphNumber �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � d ^Identify the text of the highlight itself. �class utf8� is used to make import into Anki work.    � � � � � I d e n t i f y   t h e   t e x t   o f   t h e   h i g h l i g h t   i t s e l f .   � c l a s s   u t f 8 �   i s   u s e d   t o   m a k e   i m p o r t   i n t o   A n k i   w o r k . �  � � � r   � � � � � l  � � ����� � I  � ��� � �
�� .SKIMTextnull���     **** � o   � ����� 0 anote aNote � �� ���
�� 
rtyp � m   � ���
�� 
utf8��  ��  ��   � o      ���� 0 notetext noteText �  � � � l  � ��� � ���   � + %Inner loop. Look at each paragraph...    � � � � J I n n e r   l o o p .   L o o k   a t   e a c h   p a r a g r a p h . . . �  �� � X   �j ��~ � � k   �e � �  � � � r   � � � � � [   � � � � � o   � ��}�} "0 paragraphnumber paragraphNumber � m   � ��|�|  � o      �{�{ "0 paragraphnumber paragraphNumber �  � � � l  � ��z � ��z   � S M...to see if the paragraph contains the highlight we're currently working on.    � � � � � . . . t o   s e e   i f   t h e   p a r a g r a p h   c o n t a i n s   t h e   h i g h l i g h t   w e ' r e   c u r r e n t l y   w o r k i n g   o n . �  ��y � Z   �e � ��x�w � E   � � � � � o   � ��v�v 0 eachparagraph eachParagraph � o   � ��u�u 0 notetext noteText � k   �a � �  � � � l  � ��t � ��t   � u oIf it does, grab it and the enclosing paragraph. (These might not be the best methods to use, but they work..!)    � � � � � I f   i t   d o e s ,   g r a b   i t   a n d   t h e   e n c l o s i n g   p a r a g r a p h .   ( T h e s e   m i g h t   n o t   b e   t h e   b e s t   m e t h o d s   t o   u s e ,   b u t   t h e y   w o r k . . ! ) �  � � � r   � � � � l  �
 ��s�r � I  �
�q � �
�q .SKIMFindnull���     docu � o   � �p�p 0 thedocument theDocument � �o ��n
�o 
ctxt � l  ��m�l � o  �k�k 0 notetext noteText�m  �l  �n  �s  �r   � o      �j�j (0 highlightselection highlightSelection �  � � � r   � � � l  ��i�h � I �g � �
�g .SKIMFindnull���     docu � o  �f�f 0 thedocument theDocument � �e ��d
�e 
ctxt � o  �c�c 0 eachparagraph eachParagraph�d  �i  �h   � o      �b�b $0 paragraphexcerpt paragraphExcerpt �  � � � l �a�`�_�a  �`  �_   �  �  � l �^�^   p jNow we're going to manipulate the excerpted paragraph and highlight to create the content of a flashcard.     � � N o w   w e ' r e   g o i n g   t o   m a n i p u l a t e   t h e   e x c e r p t e d   p a r a g r a p h   a n d   h i g h l i g h t   t o   c r e a t e   t h e   c o n t e n t   o f   a   f l a s h c a r d .     Q  _�] k  "V 	
	 l ""�\�\   � �Use findAndReplaceInText (taken from Apple's documentation) to replace the highlight inside the paragraph with a blank line. <mark /> is used to make the removed highlight easier to spot in Anki.    �� U s e   f i n d A n d R e p l a c e I n T e x t   ( t a k e n   f r o m   A p p l e ' s   d o c u m e n t a t i o n )   t o   r e p l a c e   t h e   h i g h l i g h t   i n s i d e   t h e   p a r a g r a p h   w i t h   a   b l a n k   l i n e .   < m a r k   / >   i s   u s e d   t o   m a k e   t h e   r e m o v e d   h i g h l i g h t   e a s i e r   t o   s p o t   i n   A n k i .
  r  "< n "8 I  #8�[�Z�[ ,0 findandreplaceintext findAndReplaceInText  c  #* o  #&�Y�Y $0 paragraphexcerpt paragraphExcerpt m  &)�X
�X 
ctxt  c  *1 o  *-�W�W 0 notetext noteText m  -0�V
�V 
ctxt �U m  14 � N < m a r k >   _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _   < / m a r k >�U  �Z    f  "# o      �T�T ,0 paragraphexcerptitem paragraphExcerptItem  !  l ==�S�R�Q�S  �R  �Q  ! "#" l ==�P$%�P  $ \ VGrab some info about the file to make it easier to look up the excerpt for reference.	   % �&& � G r a b   s o m e   i n f o   a b o u t   t h e   f i l e   t o   m a k e   i t   e a s i e r   t o   l o o k   u p   t h e   e x c e r p t   f o r   r e f e r e n c e . 	# '(' r  =H)*) l =D+�O�N+ l =D,�M�L, n  =D-.- 1  @D�K
�K 
DInf. o  =@�J�J 0 thedocument theDocument�M  �L  �O  �N  * o      �I�I 0 infolist infoList( /0/ r  IP121 m  IL33 �44  2 o      �H�H 0 documentinfo documentInfo0 565 l QQ�G�F�E�G  �F  �E  6 787 r  Q\9:9 n  QX;<; 1  TX�D
�D 
atfn< o  QT�C�C 0 infolist infoList: o      �B�B $0 documentfilename documentFilename8 =>= r  ]p?@? b  ]lABA b  ]hCDC b  ]dEFE o  ]`�A�A 0 documentinfo documentInfoF m  `cGG �HH  F i l e n a m e :  D o  dg�@�@ $0 documentfilename documentFilenameB m  hkII �JJ   @ o      �?�? 0 documentinfo documentInfo> KLK l qq�>�=�<�>  �=  �<  L MNM l qq�;OP�;  O y sNot all documents are complete. These if statements try for metadata but leave it alone if there's nothing to find.   P �QQ � N o t   a l l   d o c u m e n t s   a r e   c o m p l e t e .   T h e s e   i f   s t a t e m e n t s   t r y   f o r   m e t a d a t a   b u t   l e a v e   i t   a l o n e   i f   t h e r e ' s   n o t h i n g   t o   f i n d .N RSR r  q|TUT n  qxVWV 1  tx�:
�: 
titlW o  qt�9�9 0 infolist infoListU o      �8�8 0 documenttitle documentTitleS XYX Z  }�Z[�7�6Z > }�\]\ o  }��5�5 0 documenttitle documentTitle] m  ���4
�4 
msng[ r  ��^_^ b  ��`a` b  ��bcb b  ��ded o  ���3�3 0 documentinfo documentInfoe m  ��ff �gg  T i t l e :  c o  ���2�2 0 documenttitle documentTitlea m  ��hh �ii   _ o      �1�1 0 documentinfo documentInfo�7  �6  Y jkj r  ��lml n  ��non 1  ���0
�0 
Autho o  ���/�/ 0 infolist infoListm o      �.�.  0 documentauthor documentAuthork pqp Z  ��rs�-�,r > ��tut o  ���+�+  0 documentauthor documentAuthoru m  ���*
�* 
msngs r  ��vwv b  ��xyx b  ��z{z b  ��|}| o  ���)�) 0 documentinfo documentInfo} m  ��~~ �  A u t h o r :  { o  ���(�(  0 documentauthor documentAuthory m  ���� ���   w o      �'�' 0 documentinfo documentInfo�-  �,  q ��� l ���&�%�$�&  �%  �$  � ��� l ���#���#  � H BWe know we have a page number, so if nothing else we'll grab that.   � ��� � W e   k n o w   w e   h a v e   a   p a g e   n u m b e r ,   s o   i f   n o t h i n g   e l s e   w e ' l l   g r a b   t h a t .� ��� r  ����� b  ����� b  ����� o  ���"�" 0 documentinfo documentInfo� m  ���� ���  P a g e :  � l ����!� � I �����
� .SKIMIndxnull���     ****� o  ���� 0 apage aPage�  �!  �   � o      �� 0 documentinfo documentInfo� ��� l ������  �  �  � ��� l ������  � � �Compile the item for Anki flash card import. We're using | to indicate how fields are delimited as those characters are pretty uncommon in produced text.   � ���2 C o m p i l e   t h e   i t e m   f o r   A n k i   f l a s h   c a r d   i m p o r t .   W e ' r e   u s i n g   |   t o   i n d i c a t e   h o w   f i e l d s   a r e   d e l i m i t e d   a s   t h o s e   c h a r a c t e r s   a r e   p r e t t y   u n c o m m o n   i n   p r o d u c e d   t e x t .� ��� l ������  � h b Switch fileUUID to fileLink if you want this to work with Finder documents instead of DEVONthink.   � ��� �   S w i t c h   f i l e U U I D   t o   f i l e L i n k   i f   y o u   w a n t   t h i s   t o   w o r k   w i t h   F i n d e r   d o c u m e n t s   i n s t e a d   o f   D E V O N t h i n k .� ��� r  ���� l �
���� b  �
��� b  � ��� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� o  ���� ,0 paragraphexcerptitem paragraphExcerptItem� m  ���� ���  |� l ������ o  ���� 0 notetext noteText�  �  � m  ���� ���  |� o  ���� 0 documentinfo documentInfo� m  ���� ���  |� o  ���� 0 fileuuid fileUUID� m  ���� ���  ? p a g e =� l  	���� \   	��� l  ���� I  �
��	
�
 .SKIMIndxnull���     ****� o   �� 0 apage aPage�	  �  �  � m  �� �  �  �  �  � o      �� ,0 paragraphexcerptitem paragraphExcerptItem� ��� l ����  �  �  � ��� l ����  � � �Sometimes the PDF has weird linebreaks, but Anki uses linebreaks to differentiate between different cards. We'll use stripLineBreaks to clean up the item so that Anki doesn't mistakenly import several cards for a given item.   � ���� S o m e t i m e s   t h e   P D F   h a s   w e i r d   l i n e b r e a k s ,   b u t   A n k i   u s e s   l i n e b r e a k s   t o   d i f f e r e n t i a t e   b e t w e e n   d i f f e r e n t   c a r d s .   W e ' l l   u s e   s t r i p L i n e B r e a k s   t o   c l e a n   u p   t h e   i t e m   s o   t h a t   A n k i   d o e s n ' t   m i s t a k e n l y   i m p o r t   s e v e r a l   c a r d s   f o r   a   g i v e n   i t e m .� ��� r  ��� n ��� I  ��� � "0 striplinebreaks stripLineBreaks� ���� o  ���� ,0 paragraphexcerptitem paragraphExcerptItem��  �   �  f  � o      ���� ,0 paragraphexcerptitem paragraphExcerptItem� ��� l ��������  ��  ��  � ��� l ������  � # Add the item to the cardList.   � ��� : A d d   t h e   i t e m   t o   t h e   c a r d L i s t .� ��� s  $��� o  ���� ,0 paragraphexcerptitem paragraphExcerptItem� n      ���  ;  "#� o  "���� 0 cardlist cardList� ��� l %%��������  ��  ��  � ��� l %%������  � ? 9This is some debug logging to help investigate glitches.    � ��� r T h i s   i s   s o m e   d e b u g   l o g g i n g   t o   h e l p   i n v e s t i g a t e   g l i t c h e s .  � ��� Z  %T������� o  %&���� 	0 debug  � k  )P�� ��� I )0�����
�� .ascrcmnt****      � ****� m  ),�� ���   * * * * * * * * * * * * * * * *��  � ��� I 1<�����
�� .ascrcmnt****      � ****� b  18��� m  14�� ���  #   N o t e :  � l 47������ o  47���� 0 notetext noteText��  ��  ��  � ��� I =H�����
�� .ascrcmnt****      � ****� b  =D��� m  =@�� ��� & # #   E x c e r p t   s a m p l e :  � o  @C���� ,0 paragraphexcerptitem paragraphExcerptItem��  �  ��  I IP����
�� .ascrcmnt****      � **** m  IL �   * * * * * * * * * * * * * * * *��  ��  ��  ��  � �� l UU��������  ��  ��  ��   R      ������
�� .ascrerr ****      � ****��  ��  �]    l ``��������  ��  ��   �� l ``��������  ��  ��  ��  �x  �w  �y  �~ 0 eachparagraph eachParagraph � o   � ����� $0 listofparagraphs listOfParagraphs�  �� 0 anote aNote � n   � �	 2  � ���
�� 
Note	 o   � ����� 0 thedocument theDocument � 

 l pp��������  ��  ��    l pp����   � �Great. Now to put the import text somewhere before we import it into Anki. First, get the home folder, then set an arbitrary buffer file up (card_import.txt) to hold the imports. We'll delete that file later.    �� G r e a t .   N o w   t o   p u t   t h e   i m p o r t   t e x t   s o m e w h e r e   b e f o r e   w e   i m p o r t   i t   i n t o   A n k i .   F i r s t ,   g e t   t h e   h o m e   f o l d e r ,   t h e n   s e t   a n   a r b i t r a r y   b u f f e r   f i l e   u p   ( c a r d _ i m p o r t . t x t )   t o   h o l d   t h e   i m p o r t s .   W e ' l l   d e l e t e   t h a t   f i l e   l a t e r .  r  p{ e  pw I pw����
�� .earsffdralis        afdr m  ps��
�� afdrcusr��   o      ���� 0 
homefolder 
homeFolder  r  |� l |����� b  |� l |����� I |��� 
�� .earsffdralis        afdr m  |��
�� afdrcusr  ��!��
�� 
rtyp! m  ����
�� 
ctxt��  ��  ��   m  ��"" �##  c a r d _ i m p o r t . t x t��  ��   o      ���� 0 notesfilepath notesFilePath $%$ l ����&'��  &   Open the file for writing.   ' �(( 4 O p e n   t h e   f i l e   f o r   w r i t i n g .% )*) r  ��+,+ c  ��-.- l ��/����/ I ����01
�� .rdwropenshor       file0 l ��2����2 o  ������ 0 notesfilepath notesFilePath��  ��  1 ��3��
�� 
perm3 m  ����
�� boovtrue��  ��  ��  . m  ����
�� 
utf8, o      ���� 0 	notesfile 	notesFile* 454 l ����67��  6 ^ XFor each item in the cardList list, write them to the buffer file, then add a linebreak.   7 �88 � F o r   e a c h   i t e m   i n   t h e   c a r d L i s t   l i s t ,   w r i t e   t h e m   t o   t h e   b u f f e r   f i l e ,   t h e n   a d d   a   l i n e b r e a k .5 9:9 X  ��;��<; k  ��== >?> I ����@A
�� .rdwrwritnull���     ****@ o  ������ 0 eachhighlight eachHighlightA ��BC
�� 
refnB o  ������ 0 	notesfile 	notesFileC ��D��
�� 
as  D m  ����
�� 
utf8��  ? E��E I ����FG
�� .rdwrwritnull���     ****F m  ��HH �II  
G ��JK
�� 
refnJ o  ������ 0 	notesfile 	notesFileK ��L��
�� 
as  L m  ����
�� 
utf8��  ��  �� 0 eachhighlight eachHighlight< o  ������ 0 cardlist cardList: MNM l ����OP��  O   Close the file to save it.   P �QQ 4 C l o s e   t h e   f i l e   t o   s a v e   i t .N RSR I ����T��
�� .rdwrclosnull���     ****T o  ������ 0 	notesfile 	notesFile��  S UVU l ����������  ��  ��  V WXW l ����YZ��  Y q kAnki isn't set up for AppleScript, so we'll force Anki to open the file via Open With... to do the import.    Z �[[ � A n k i   i s n ' t   s e t   u p   f o r   A p p l e S c r i p t ,   s o   w e ' l l   f o r c e   A n k i   t o   o p e n   t h e   f i l e   v i a   O p e n   W i t h . . .   t o   d o   t h e   i m p o r t .  X \]\ O  �%^_^ k  �$`` aba I ����c��
�� .ascrcmnt****      � ****c o  ������ 0 notesfilepath notesFilePath��  b d��d Q  �$ef��e k  gg hih r  jkj I 	��l��
�� .earsffdralis        afdrl m  mmx                                                                                      @ alis      Macintosh HD                   BD ����Anki.app                                                       ����            ����  
 cu             Applications  /:Applications:Anki.app/    A n k i . a p p    M a c i n t o s h   H D  Applications/Anki.app   / ��  ��  k o      ���� 0 ankipath ankiPathi n��n I ��op
�� .aevtodocnull  �    aliso o  ���� 0 notesfilepath notesFilePathp ��q��
�� 
usinq l r����r o  ���� 0 ankipath ankiPath��  ��  ��  ��  f R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  _ m  ��ss�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ] tut l &&��������  ��  ��  u vwv I &+��x��
�� .sysodelanull��� ��� nmbrx m  &'���� ��  w yzy l ,,��{|��  {  Delete the buffer file.   | �}} . D e l e t e   t h e   b u f f e r   f i l e .z ~~ O ,?��� I 2>����
�� .coredelonull���     ditm� 4  2:�~�
�~ 
alis� o  69�}�} 0 notesfilepath notesFilePath�  � m  ,/���                                                                                  sevs  alis    \  Macintosh HD                   BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   ��|� l @@�{�z�y�{  �z  �y  �|   r m   i l��x                                                                                  SKim  alis      Macintosh HD                   BD ����Skim.app                                                       ����            ����  
 cu             Applications  /:Applications:Skim.app/    S k i m . a p p    M a c i n t o s h   H D  Applications/Skim.app   / ��  ��  ��   o ��� l     �x�w�v�x  �w  �v  � ��� i     ��� I      �u��t�u ,0 findandreplaceintext findAndReplaceInText� ��� o      �s�s 0 thetext theText� ��� o      �r�r "0 thesearchstring theSearchString� ��q� o      �p�p ,0 thereplacementstring theReplacementString�q  �t  � k      �� ��� r     ��� o     �o�o "0 thesearchstring theSearchString� n     ��� 1    �n
�n 
txdl� 1    �m
�m 
ascr� ��� r    ��� n    	��� 2    	�l
�l 
citm� o    �k�k 0 thetext theText� o      �j�j 0 thetextitems theTextItems� ��� r    ��� o    �i�i ,0 thereplacementstring theReplacementString� n     ��� 1    �h
�h 
txdl� 1    �g
�g 
ascr� ��� r    ��� c    ��� o    �f�f 0 thetextitems theTextItems� m    �e
�e 
TEXT� o      �d�d 0 thetext theText� ��� r    ��� m    �� ���  � n     ��� 1    �c
�c 
txdl� 1    �b
�b 
ascr� ��a� L     �� o    �`�` 0 thetext theText�a  � ��� l     �_�^�]�_  �^  �]  � ��\� i    ��� I      �[��Z�[ "0 striplinebreaks stripLineBreaks� ��Y� o      �X�X 0 thetext theText�Y  �Z  � k     ,�� ��� r     ��� J     �� ��� b     ��� o     �W
�W 
ret � 1    �V
�V 
lnfd� ��� o    �U
�U 
ret � ��� 1    �T
�T 
lnfd� ��� 5    
�S��R
�S 
cha � m    �Q�Q )
�R kfrmID  � ��P� 5   
 �O��N
�O 
cha � m    �M�M (
�N kfrmID  �P  � n     ��� 1    �L
�L 
txdl� 1    �K
�K 
ascr� ��� r    ��� n    ��� 2    �J
�J 
citm� o    �I�I 0 thetext theText� o      �H�H 0 thetextitems theTextItems� ��� r    #��� J    �� ��G� m    �� ���  �G  � n     ��� 1     "�F
�F 
txdl� 1     �E
�E 
ascr� ��� r   $ )��� c   $ '��� o   $ %�D�D 0 thetextitems theTextItems� m   % &�C
�C 
TEXT� o      �B�B 0 newtext newText� ��A� L   * ,�� o   * +�@�@ 0 newtext newText�A  �\       �?�����?  � �>�=�<�> ,0 findandreplaceintext findAndReplaceInText�= "0 striplinebreaks stripLineBreaks
�< .aevtoappnull  �   � ****� �;��:�9���8�; ,0 findandreplaceintext findAndReplaceInText�: �7��7 �  �6�5�4�6 0 thetext theText�5 "0 thesearchstring theSearchString�4 ,0 thereplacementstring theReplacementString�9  � �3�2�1�0�3 0 thetext theText�2 "0 thesearchstring theSearchString�1 ,0 thereplacementstring theReplacementString�0 0 thetextitems theTextItems� �/�.�-�,�
�/ 
ascr
�. 
txdl
�- 
citm
�, 
TEXT�8 !���,FO��-E�O���,FO��&E�O���,FO�� �+��*�)���(�+ "0 striplinebreaks stripLineBreaks�* �'��' �  �&�& 0 thetext theText�)  � �%�$�#�% 0 thetext theText�$ 0 thetextitems theTextItems�# 0 newtext newText� �"�!� ���������
�" 
ret 
�! 
lnfd
�  
cha � )
� kfrmID  � (� 
� 
ascr
� 
txdl
� 
citm
� 
TEXT�( -��%��)���0)���0�v��,FO��-E�O�kv��,FO��&E�O�� �������
� .aevtoappnull  �   � ****� k    B��  ��  ��  n��  �  �  � ���� 0 anote aNote� 0 eachparagraph eachParagraph� 0 eachhighlight eachHighlight� e�� j����
�	��� 8������ �������� f���������������������������������������������������3������GI������fh����~�������������������������"����������������H��sm������������ 	0 debug  
� 
capp
� kfrmID  
� .miscactvnull��� ��� null
� 
DTsl�
 "0 selectedrecords selectedRecords
�	 
cobj� 0 targetrecord targetRecord
� 
DTty
� 
TEXT� 0 	targetpdf 	targetPDF
� 
rURL� 0 targetpdflink targetPDFLink
� 
tdta� 0 thepdf thePDF�  0 thelink theLink
�� 
ppth�� 0 filepath filePath
�� 
UUID�� 0 fileuuid fileUUID�� 0 filelink fileLink
�� .aevtodocnull  �    alis�� 0 thedocument theDocument
�� .SKIMConvnull���     docu�� 0 cardlist cardList
�� 
Note
�� 
kocl
�� .corecnte****       ****
�� .SKIMPagsnull���     ****�� 0 apage aPage
�� 
cpar�� $0 listofparagraphs listOfParagraphs�� "0 paragraphnumber paragraphNumber
�� 
rtyp
�� 
utf8
�� .SKIMTextnull���     ****�� 0 notetext noteText
�� 
ctxt
�� .SKIMFindnull���     docu�� (0 highlightselection highlightSelection�� $0 paragraphexcerpt paragraphExcerpt�� ,0 findandreplaceintext findAndReplaceInText�� ,0 paragraphexcerptitem paragraphExcerptItem
�� 
DInf�� 0 infolist infoList�� 0 documentinfo documentInfo
�� 
atfn�� $0 documentfilename documentFilename
�� 
titl�� 0 documenttitle documentTitle
�� 
msng
�� 
Auth��  0 documentauthor documentAuthor
�� .SKIMIndxnull���     ****�� "0 striplinebreaks stripLineBreaks
�� .ascrcmnt****      � ****��  ��  
�� afdrcusr
�� .earsffdralis        afdr�� 0 
homefolder 
homeFolder�� 0 notesfilepath notesFilePath
�� 
perm
�� .rdwropenshor       file�� 0 	notesfile 	notesFile
�� 
refn
�� 
as  �� 
�� .rdwrwritnull���     ****
�� .rdwrclosnull���     ****�� 0 ankipath ankiPath
�� 
usin
�� .sysodelanull��� ��� nmbr
�� 
alis
�� .coredelonull���     ditm�CfE�O)���0 ]*j O*�,E�O��k/EE�O��,�&� �E�O��,E�Y hO��,E` O�E` O�a ,E` O�a ,E` Oa _ %E` OPUOa �*j O_ j E` O_ j OjvE` O�_ a -[a �l kh  �j  �i/E` !O_ !a "-E` #OjE` $O�a %a &l 'E` (O�_ #[a �l kh _ $kE` $O�_ (i_ a )_ (l *E` +O_ a )�l *E` ,O9)_ ,a )&_ (a )&a -m+ .E` /O_ a 0,E` 1Oa 2E` 3O_ 1a 4,E` 5O_ 3a 6%_ 5%a 7%E` 3O_ 1a 8,E` 9O_ 9a : _ 3a ;%_ 9%a <%E` 3Y hO_ 1a =,E` >O_ >a : _ 3a ?%_ >%a @%E` 3Y hO_ 3a A%_ !j B%E` 3O_ /a C%_ (%a D%_ 3%a E%_ %a F%_ !j Bk%E` /O)_ /k+ GE` /O_ /_ 6GO� ,a Hj IOa J_ (%j IOa K_ /%j IOa Lj IY hOPW X M NhOPY h[OY��[OY�8Oa Oj PE` QOa Oa %a )l Pa R%E` SO_ Sa Tel Ua &&E` VO A_ [a �l kh �a W_ Va Xa &a Y ZOa [a W_ Va Xa &a Y Z[OY��O_ Vj \Oa ] /_ Sj IO a ^j PE` _O_ Sa `_ _l W X M NhUOmj aOa b *a c_ S/j dUOPUascr  ��ޭ