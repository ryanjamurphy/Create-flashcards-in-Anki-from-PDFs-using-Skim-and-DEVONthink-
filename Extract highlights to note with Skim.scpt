FasdUAS 1.101.10   ��   ��    k             l      ��  ��   82

This script extracts PDF highlights (eachHighlight) into a text file that can be imported into Anki. Separate Anki cards are delineated by a newline. Separate fields for the sides of cards can be indicated by a specified single-character separator (ideally "|"). 
Todo: build out something testable on the extracted text. E.g., use TFIDF to pick up keywords in a given extraction and use Skim's automation services to blank out the word(s) in the highlight. Then, append the words in order to the card using a second field. Scratch notes for this are commented out above.
Other ideas: Link to the PDF file and the appropriate page for reference (instead of or in addition to screengrabs). Ideally this can be done via a DEVONthink item link (which can use ?page=5 in URL schemes to open directly to a given page). 

     � 	 	d 
 
 T h i s   s c r i p t   e x t r a c t s   P D F   h i g h l i g h t s   ( e a c h H i g h l i g h t )   i n t o   a   t e x t   f i l e   t h a t   c a n   b e   i m p o r t e d   i n t o   A n k i .   S e p a r a t e   A n k i   c a r d s   a r e   d e l i n e a t e d   b y   a   n e w l i n e .   S e p a r a t e   f i e l d s   f o r   t h e   s i d e s   o f   c a r d s   c a n   b e   i n d i c a t e d   b y   a   s p e c i f i e d   s i n g l e - c h a r a c t e r   s e p a r a t o r   ( i d e a l l y   " | " ) .   
 T o d o :   b u i l d   o u t   s o m e t h i n g   t e s t a b l e   o n   t h e   e x t r a c t e d   t e x t .   E . g . ,   u s e   T F I D F   t o   p i c k   u p   k e y w o r d s   i n   a   g i v e n   e x t r a c t i o n   a n d   u s e   S k i m ' s   a u t o m a t i o n   s e r v i c e s   t o   b l a n k   o u t   t h e   w o r d ( s )   i n   t h e   h i g h l i g h t .   T h e n ,   a p p e n d   t h e   w o r d s   i n   o r d e r   t o   t h e   c a r d   u s i n g   a   s e c o n d   f i e l d .   S c r a t c h   n o t e s   f o r   t h i s   a r e   c o m m e n t e d   o u t   a b o v e . 
 O t h e r   i d e a s :   L i n k   t o   t h e   P D F   f i l e   a n d   t h e   a p p r o p r i a t e   p a g e   f o r   r e f e r e n c e   ( i n s t e a d   o f   o r   i n   a d d i t i o n   t o   s c r e e n g r a b s ) .   I d e a l l y   t h i s   c a n   b e   d o n e   v i a   a   D E V O N t h i n k   i t e m   l i n k   ( w h i c h   c a n   u s e   ? p a g e = 5   i n   U R L   s c h e m e s   t o   o p e n   d i r e c t l y   t o   a   g i v e n   p a g e ) .   
 
   
  
 l     ��������  ��  ��        l     ����  r         m     ��
�� boovfals  o      ���� 	0 debug  ��  ��        l     ��������  ��  ��        l    ����  r        I   	������
�� .sysostdfalis    ��� null��  ��    o      ���� 0 	targetpdf 	targetPDF��  ��        l    ����  r        c        l    ����  n       !   1    ��
�� 
psxp ! o    ���� 0 	targetpdf 	targetPDF��  ��    m    ��
�� 
ctxt  o      ���� 0 filepath filePath��  ��     " # " l    $���� $ r     % & % b     ' ( ' m     ) ) � * *  f i l e : / / ( o    ���� 0 filepath filePath & o      ���� 0 filelink fileLink��  ��   #  + , + l     ��������  ��  ��   ,  - . - l  � /���� / O   � 0 1 0 k   � 2 2  3 4 3 l   �� 5 6��   5  open the PDF in Skim    6 � 7 7 ( o p e n   t h e   P D F   i n   S k i m 4  8 9 8 r    % : ; : I   #�� <��
�� .aevtodocnull  �    alis < o    ���� 0 	targetpdf 	targetPDF��   ; o      ���� 0 thedocument theDocument 9  = > = l  & &�� ? @��   ? : 4convert highlights in the opened PDF into Skim notes    @ � A A h c o n v e r t   h i g h l i g h t s   i n   t h e   o p e n e d   P D F   i n t o   S k i m   n o t e s >  B C B I  & +�� D��
�� .SKIMConvnull���     docu D o   & '���� 0 thedocument theDocument��   C  E F E l  , ,�� G H��   G @ :initialize a list to hold items for import into Anki cards    H � I I t i n i t i a l i z e   a   l i s t   t o   h o l d   i t e m s   f o r   i m p o r t   i n t o   A n k i   c a r d s F  J K J r   , 0 L M L J   , .����   M o      ���� 0 cardlist cardList K  N O N l  1 1��������  ��  ��   O  P Q P l  1 1�� R S��   R>8Main loop. Essentially, take every note in the Skim document (e.g., every highlight), get the text of the note, and find the paragraph containing that highlight. Replace the highlight inside the paragraph with a marked blank line. Finally, grab some info about the PDF file so that the paragraph is easy to find.    S � T Tp M a i n   l o o p .   E s s e n t i a l l y ,   t a k e   e v e r y   n o t e   i n   t h e   S k i m   d o c u m e n t   ( e . g . ,   e v e r y   h i g h l i g h t ) ,   g e t   t h e   t e x t   o f   t h e   n o t e ,   a n d   f i n d   t h e   p a r a g r a p h   c o n t a i n i n g   t h a t   h i g h l i g h t .   R e p l a c e   t h e   h i g h l i g h t   i n s i d e   t h e   p a r a g r a p h   w i t h   a   m a r k e d   b l a n k   l i n e .   F i n a l l y ,   g r a b   s o m e   i n f o   a b o u t   t h e   P D F   f i l e   s o   t h a t   t h e   p a r a g r a p h   i s   e a s y   t o   f i n d . Q  U V U X   1� W�� X W k   C� Y Y  Z [ Z l  C C��������  ��  ��   [  \ ] \ l  C C�� ^ _��   ^ * $Identify the page of the given note.    _ � ` ` H I d e n t i f y   t h e   p a g e   o f   t h e   g i v e n   n o t e . ]  a b a r   C O c d c n   C K e f e 4  H K�� g
�� 
cobj g m   I J������ f l  C H h���� h I  C H�� i��
�� .SKIMPagsnull���     **** i o   C D���� 0 anote aNote��  ��  ��   d o      ���� 0 apage aPage b  j k j l  P P��������  ��  ��   k  l m l l  P P�� n o��   n y sInitialize a list of the paragraphs. We will iterate through these to identify the highlight's enclosing paragraph.    o � p p � I n i t i a l i z e   a   l i s t   o f   t h e   p a r a g r a p h s .   W e   w i l l   i t e r a t e   t h r o u g h   t h e s e   t o   i d e n t i f y   t h e   h i g h l i g h t ' s   e n c l o s i n g   p a r a g r a p h . m  q r q r   P [ s t s n   P W u v u 2  S W��
�� 
cpar v o   P S���� 0 apage aPage t o      ���� $0 listofparagraphs listOfParagraphs r  w x w r   \ a y z y m   \ ]����   z o      ���� "0 paragraphnumber paragraphNumber x  { | { l  b b��������  ��  ��   |  } ~ } l  b b��  ���    d ^Identify the text of the highlight itself. �class utf8� is used to make import into Anki work.    � � � � � I d e n t i f y   t h e   t e x t   o f   t h e   h i g h l i g h t   i t s e l f .   � c l a s s   u t f 8 �   i s   u s e d   t o   m a k e   i m p o r t   i n t o   A n k i   w o r k . ~  � � � r   b q � � � l  b m ����� � I  b m�� � �
�� .SKIMTextnull���     **** � o   b c���� 0 anote aNote � �� ���
�� 
rtyp � m   f i��
�� 
utf8��  ��  ��   � o      ���� 0 notetext noteText �  � � � l  r r�� � ���   � + %Inner loop. Look at each paragraph...    � � � � J I n n e r   l o o p .   L o o k   a t   e a c h   p a r a g r a p h . . . �  ��� � X   r� ��� � � k   �� � �  � � � r   � � � � � [   � � � � � o   � ����� "0 paragraphnumber paragraphNumber � m   � �����  � o      ���� "0 paragraphnumber paragraphNumber �  � � � l  � ��� � ���   � S M...to see if the paragraph contains the highlight we're currently working on.    � � � � � . . . t o   s e e   i f   t h e   p a r a g r a p h   c o n t a i n s   t h e   h i g h l i g h t   w e ' r e   c u r r e n t l y   w o r k i n g   o n . �  ��� � Z   �� � ����� � E   � � � � � o   � ����� 0 eachparagraph eachParagraph � o   � ����� 0 notetext noteText � k   �� � �  � � � l  � ��� � ���   � u oIf it does, grab it and the enclosing paragraph. (These might not be the best methods to use, but they work..!)    � � � � � I f   i t   d o e s ,   g r a b   i t   a n d   t h e   e n c l o s i n g   p a r a g r a p h .   ( T h e s e   m i g h t   n o t   b e   t h e   b e s t   m e t h o d s   t o   u s e ,   b u t   t h e y   w o r k . . ! ) �  � � � r   � � � � � l  � � ����� � I  � ��� � �
�� .SKIMFindnull���     docu � o   � ����� 0 thedocument theDocument � �� ���
�� 
ctxt � l  � � ����� � o   � ����� 0 notetext noteText��  ��  ��  ��  ��   � o      ���� (0 highlightselection highlightSelection �  � � � r   � � � � � l  � � ����� � I  � ��� � �
�� .SKIMFindnull���     docu � o   � ����� 0 thedocument theDocument � �� ���
�� 
ctxt � o   � ����� 0 eachparagraph eachParagraph��  ��  ��   � o      ���� $0 paragraphexcerpt paragraphExcerpt �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � p jNow we're going to manipulate the excerpted paragraph and highlight to create the content of a flashcard.     � � � � � N o w   w e ' r e   g o i n g   t o   m a n i p u l a t e   t h e   e x c e r p t e d   p a r a g r a p h   a n d   h i g h l i g h t   t o   c r e a t e   t h e   c o n t e n t   o f   a   f l a s h c a r d .   �  � � � Q   �� � ��� � k   �� � �  � � � l  � ��� � ���   � � �Use findAndReplaceInText (taken from Apple's documentation) to replace the highlight inside the paragraph with a blank line. <mark /> is used to make the removed highlight easier to spot in Anki.    � � � �� U s e   f i n d A n d R e p l a c e I n T e x t   ( t a k e n   f r o m   A p p l e ' s   d o c u m e n t a t i o n )   t o   r e p l a c e   t h e   h i g h l i g h t   i n s i d e   t h e   p a r a g r a p h   w i t h   a   b l a n k   l i n e .   < m a r k   / >   i s   u s e d   t o   m a k e   t h e   r e m o v e d   h i g h l i g h t   e a s i e r   t o   s p o t   i n   A n k i . �  � � � r   � � � � � n  � � � � � I   � ��� ����� ,0 findandreplaceintext findAndReplaceInText �  � � � c   � � � � � o   � ����� $0 paragraphexcerpt paragraphExcerpt � m   � ���
�� 
ctxt �  � � � c   � � � � � o   � ����� 0 notetext noteText � m   � ���
�� 
ctxt �  �� � m   � � � � � � � N < m a r k >   _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _   < / m a r k >�  ��   �  f   � � � o      �~�~ ,0 paragraphexcerptitem paragraphExcerptItem �  � � � l  � ��}�|�{�}  �|  �{   �  � � � l  � ��z � ��z   � \ VGrab some info about the file to make it easier to look up the excerpt for reference.	    � � � � � G r a b   s o m e   i n f o   a b o u t   t h e   f i l e   t o   m a k e   i t   e a s i e r   t o   l o o k   u p   t h e   e x c e r p t   f o r   r e f e r e n c e . 	 �  � � � r   � � � � � l  � � ��y�x � l  � � ��w�v � n   � � � � � 1   � ��u
�u 
DInf � o   � ��t�t 0 thedocument theDocument�w  �v  �y  �x   � o      �s�s 0 infolist infoList �  � � � r   � � � � � m   � � � � � � �   � o      �r�r 0 documentinfo documentInfo �  � � � l  � ��q�p�o�q  �p  �o   �  � � � r   � � � � � n   � � � � � 1   � ��n
�n 
atfn � o   � ��m�m 0 infolist infoList � o      �l�l $0 documentfilename documentFilename �  � � � r   � � � � � b   � � � � � b   � �   b   � � o   � ��k�k 0 documentinfo documentInfo m   � � �  F i l e n a m e :   o   � ��j�j $0 documentfilename documentFilename � m   � � �    � o      �i�i 0 documentinfo documentInfo � 	 l  � ��h�g�f�h  �g  �f  	 

 l  � ��e�e   y sNot all documents are complete. These if statements try for metadata but leave it alone if there's nothing to find.    � � N o t   a l l   d o c u m e n t s   a r e   c o m p l e t e .   T h e s e   i f   s t a t e m e n t s   t r y   f o r   m e t a d a t a   b u t   l e a v e   i t   a l o n e   i f   t h e r e ' s   n o t h i n g   t o   f i n d .  r   � n   � 1   ��d
�d 
titl o   � ��c�c 0 infolist infoList o      �b�b 0 documenttitle documentTitle  Z  )�a�` >  o  �_�_ 0 documenttitle documentTitle m  �^
�^ 
msng r  % b  ! b    b  !"! o  �]�] 0 documentinfo documentInfo" m  ## �$$  T i t l e :    o  �\�\ 0 documenttitle documentTitle m   %% �&&    o      �[�[ 0 documentinfo documentInfo�a  �`   '(' r  *5)*) n  *1+,+ 1  -1�Z
�Z 
Auth, o  *-�Y�Y 0 infolist infoList* o      �X�X  0 documentauthor documentAuthor( -.- Z  6W/0�W�V/ > 6=121 o  69�U�U  0 documentauthor documentAuthor2 m  9<�T
�T 
msng0 r  @S343 b  @O565 b  @K787 b  @G9:9 o  @C�S�S 0 documentinfo documentInfo: m  CF;; �<<  A u t h o r :  8 o  GJ�R�R  0 documentauthor documentAuthor6 m  KN== �>>   4 o      �Q�Q 0 documentinfo documentInfo�W  �V  . ?@? l XX�P�O�N�P  �O  �N  @ ABA l XX�MCD�M  C H BWe know we have a page number, so if nothing else we'll grab that.   D �EE � W e   k n o w   w e   h a v e   a   p a g e   n u m b e r ,   s o   i f   n o t h i n g   e l s e   w e ' l l   g r a b   t h a t .B FGF r  XkHIH b  XgJKJ b  X_LML o  X[�L�L 0 documentinfo documentInfoM m  [^NN �OO  P a g e :  K l _fP�K�JP I _f�IQ�H
�I .SKIMIndxnull���     ****Q o  _b�G�G 0 apage aPage�H  �K  �J  I o      �F�F 0 documentinfo documentInfoG RSR l ll�E�D�C�E  �D  �C  S TUT l ll�BVW�B  V � �Compile the item for Anki flash card import. We're using | to indicate how fields are delimited as those characters are pretty uncommon in produced text.   W �XX2 C o m p i l e   t h e   i t e m   f o r   A n k i   f l a s h   c a r d   i m p o r t .   W e ' r e   u s i n g   |   t o   i n d i c a t e   h o w   f i e l d s   a r e   d e l i m i t e d   a s   t h o s e   c h a r a c t e r s   a r e   p r e t t y   u n c o m m o n   i n   p r o d u c e d   t e x t .U YZY r  l�[\[ l l�]�A�@] b  l�^_^ b  l�`a` b  lbcb b  l{ded b  lwfgf b  lshih o  lo�?�? ,0 paragraphexcerptitem paragraphExcerptItemi m  orjj �kk  |g l svl�>�=l o  sv�<�< 0 notetext noteText�>  �=  e m  wzmm �nn  |c o  {~�;�; 0 documentinfo documentInfoa m  �oo �pp  |_ o  ���:�: 0 filelink fileLink�A  �@  \ o      �9�9 ,0 paragraphexcerptitem paragraphExcerptItemZ qrq l ���8�7�6�8  �7  �6  r sts l ���5uv�5  u � �Sometimes the PDF has weird linebreaks, but Anki uses linebreaks to differentiate between different cards. We'll use stripLineBreaks to clean up the item so that Anki doesn't mistakenly import several cards for a given item.   v �ww� S o m e t i m e s   t h e   P D F   h a s   w e i r d   l i n e b r e a k s ,   b u t   A n k i   u s e s   l i n e b r e a k s   t o   d i f f e r e n t i a t e   b e t w e e n   d i f f e r e n t   c a r d s .   W e ' l l   u s e   s t r i p L i n e B r e a k s   t o   c l e a n   u p   t h e   i t e m   s o   t h a t   A n k i   d o e s n ' t   m i s t a k e n l y   i m p o r t   s e v e r a l   c a r d s   f o r   a   g i v e n   i t e m .t xyx r  ��z{z n ��|}| I  ���4~�3�4 "0 striplinebreaks stripLineBreaks~ �2 o  ���1�1 ,0 paragraphexcerptitem paragraphExcerptItem�2  �3  }  f  ��{ o      �0�0 ,0 paragraphexcerptitem paragraphExcerptItemy ��� l ���/�.�-�/  �.  �-  � ��� l ���,���,  � # Add the item to the cardList.   � ��� : A d d   t h e   i t e m   t o   t h e   c a r d L i s t .� ��� s  ����� o  ���+�+ ,0 paragraphexcerptitem paragraphExcerptItem� n      ���  ;  ��� o  ���*�* 0 cardlist cardList� ��� l ���)�(�'�)  �(  �'  � ��� l ���&���&  � ? 9This is some debug logging to help investigate glitches.    � ��� r T h i s   i s   s o m e   d e b u g   l o g g i n g   t o   h e l p   i n v e s t i g a t e   g l i t c h e s .  � ��� Z  �����%�$� o  ���#�# 	0 debug  � k  ���� ��� I ���"��!
�" .ascrcmnt****      � ****� m  ���� ���   * * * * * * * * * * * * * * * *�!  � ��� I ��� ��
�  .ascrcmnt****      � ****� b  ����� m  ���� ���  #   N o t e :  � l ������ o  ���� 0 notetext noteText�  �  �  � ��� I �����
� .ascrcmnt****      � ****� b  ����� m  ���� ��� & # #   E x c e r p t   s a m p l e :  � o  ���� ,0 paragraphexcerptitem paragraphExcerptItem�  � ��� I �����
� .ascrcmnt****      � ****� m  ���� ���   * * * * * * * * * * * * * * * *�  �  �%  �$  � ��� l ������  �  �  �   � R      ���
� .ascrerr ****      � ****�  �  ��   � ��� l ������  �  �  � ��� l ���
�	��
  �	  �  �  ��  ��  ��  �� 0 eachparagraph eachParagraph � o   u x�� $0 listofparagraphs listOfParagraphs��  �� 0 anote aNote X n   4 7��� 2  5 7�
� 
Note� o   4 5�� 0 thedocument theDocument V ��� l ������  �  �  � ��� l ������  � � �Great. Now to put the import text somewhere before we import it into Anki. First, get the home folder, then set an arbitrary buffer file up (card_import.txt) to hold the imports. We'll delete that file later.   � ���� G r e a t .   N o w   t o   p u t   t h e   i m p o r t   t e x t   s o m e w h e r e   b e f o r e   w e   i m p o r t   i t   i n t o   A n k i .   F i r s t ,   g e t   t h e   h o m e   f o l d e r ,   t h e n   s e t   a n   a r b i t r a r y   b u f f e r   f i l e   u p   ( c a r d _ i m p o r t . t x t )   t o   h o l d   t h e   i m p o r t s .   W e ' l l   d e l e t e   t h a t   f i l e   l a t e r .� ��� r  ����� e  ���� I ��� ���
�  .earsffdralis        afdr� m  ����
�� afdrcusr��  � o      ���� 0 
homefolder 
homeFolder� ��� r  ���� l ������� b  ���� l � ������ I � ����
�� .earsffdralis        afdr� m  ����
�� afdrcusr� �����
�� 
rtyp� m  ����
�� 
ctxt��  ��  ��  � m   �� ���  c a r d _ i m p o r t . t x t��  ��  � o      ���� 0 notesfilepath notesFilePath� ��� l 		������  �   Open the file for writing.   � ��� 4 O p e n   t h e   f i l e   f o r   w r i t i n g .� ��� r  	��� c  	��� l 	������ I 	����
�� .rdwropenshor       file� l 	������ o  	���� 0 notesfilepath notesFilePath��  ��  � �����
�� 
perm� m  ��
�� boovtrue��  ��  ��  � m  ��
�� 
utf8� o      ���� 0 	notesfile 	notesFile� ��� l ������  � ^ XFor each item in the cardList list, write them to the buffer file, then add a linebreak.   � ��� � F o r   e a c h   i t e m   i n   t h e   c a r d L i s t   l i s t ,   w r i t e   t h e m   t o   t h e   b u f f e r   f i l e ,   t h e n   a d d   a   l i n e b r e a k .� ��� X  [����� k  -V�� ��� I -@����
�� .rdwrwritnull���     ****� o  -.���� 0 eachhighlight eachHighlight� ����
�� 
refn� o  14���� 0 	notesfile 	notesFile� �����
�� 
as  � m  7:��
�� 
utf8��  � ���� I AV����
�� .rdwrwritnull���     ****� m  AD�� ���  
� ����
�� 
refn� o  GJ���� 0 	notesfile 	notesFile� �����
�� 
as  � m  MP��
�� 
utf8��  ��  �� 0 eachhighlight eachHighlight� o   !���� 0 cardlist cardList� ��� l \\������  �   Close the file to save it.   � ��� 4 C l o s e   t h e   f i l e   t o   s a v e   i t .� � � I \c����
�� .rdwrclosnull���     **** o  \_���� 0 	notesfile 	notesFile��     l dd��������  ��  ��    l dd����   q kAnki isn't set up for AppleScript, so we'll force Anki to open the file via Open With... to do the import.     � � A n k i   i s n ' t   s e t   u p   f o r   A p p l e S c r i p t ,   s o   w e ' l l   f o r c e   A n k i   t o   o p e n   t h e   f i l e   v i a   O p e n   W i t h . . .   t o   d o   t h e   i m p o r t .   	
	 O  d� k  j�  I jq����
�� .ascrcmnt****      � **** o  jm���� 0 notesfilepath notesFilePath��   �� Q  r��� k  u�  r  u� I u|����
�� .earsffdralis        afdr m  uxx                                                                                      @ alis      Macintosh HD                   BD ����Anki.app                                                       ����            ����  
 cu             Applications  /:Applications:Anki.app/    A n k i . a p p    M a c i n t o s h   H D  Applications/Anki.app   / ��  ��   o      ���� 0 ankipath ankiPath �� I ����
�� .aevtodocnull  �    alis o  ������ 0 notesfilepath notesFilePath ����
�� 
usin l ������ o  ������ 0 ankipath ankiPath��  ��  ��  ��   R      ������
�� .ascrerr ****      � ****��  ��  ��  ��   m  dg  �                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  
 !"! l ����������  ��  ��  " #$# I ����%��
�� .sysodelanull��� ��� nmbr% m  ������ ��  $ &'& l ����()��  (  Delete the buffer file.   ) �** . D e l e t e   t h e   b u f f e r   f i l e .' +,+ O ��-.- I ����/��
�� .coredelonull���     ditm/ 4  ����0
�� 
alis0 o  ������ 0 notesfilepath notesFilePath��  . m  ��11�                                                                                  sevs  alis    \  Macintosh HD                   BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  , 2��2 l ����������  ��  ��  ��   1 m    33x                                                                                  SKim  alis      Macintosh HD                   BD ����Skim.app                                                       ����            ����  
 cu             Applications  /:Applications:Skim.app/    S k i m . a p p    M a c i n t o s h   H D  Applications/Skim.app   / ��  ��  ��   . 454 l     ��������  ��  ��  5 676 l     ��������  ��  ��  7 898 i     :;: I      ��<���� ,0 findandreplaceintext findAndReplaceInText< =>= o      ���� 0 thetext theText> ?@? o      ���� "0 thesearchstring theSearchString@ A��A o      ���� ,0 thereplacementstring theReplacementString��  ��  ; k      BB CDC r     EFE o     ���� "0 thesearchstring theSearchStringF n     GHG 1    ��
�� 
txdlH 1    ��
�� 
ascrD IJI r    KLK n    	MNM 2    	��
�� 
citmN o    ���� 0 thetext theTextL o      ���� 0 thetextitems theTextItemsJ OPO r    QRQ o    ���� ,0 thereplacementstring theReplacementStringR n     STS 1    ��
�� 
txdlT 1    ��
�� 
ascrP UVU r    WXW c    YZY o    ���� 0 thetextitems theTextItemsZ m    ��
�� 
TEXTX o      ���� 0 thetext theTextV [\[ r    ]^] m    __ �``  ^ n     aba 1    ��
�� 
txdlb 1    ��
�� 
ascr\ c��c L     dd o    ���� 0 thetext theText��  9 efe l     ��������  ��  ��  f g��g i    hih I      ��j���� "0 striplinebreaks stripLineBreaksj k��k o      ���� 0 thetext theText��  ��  i k     ,ll mnm r     opo J     qq rsr b     tut o     ��
�� 
ret u 1    ��
�� 
lnfds vwv o    ��
�� 
ret w xyx 1    ��
�� 
lnfdy z{z 5    
��|��
�� 
cha | m    ���� )
�� kfrmID  { }��} 5   
 �~�~
� 
cha ~ m    �}�} (
�~ kfrmID  ��  p n     � 1    �|
�| 
txdl� 1    �{
�{ 
ascrn ��� r    ��� n    ��� 2    �z
�z 
citm� o    �y�y 0 thetext theText� o      �x�x 0 thetextitems theTextItems� ��� r    #��� J    �� ��w� m    �� ���  �w  � n     ��� 1     "�v
�v 
txdl� 1     �u
�u 
ascr� ��� r   $ )��� c   $ '��� o   $ %�t�t 0 thetextitems theTextItems� m   % &�s
�s 
TEXT� o      �r�r 0 newtext newText� ��q� L   * ,�� o   * +�p�p 0 newtext newText�q  ��       �o�����n�m�l�o  � �k�j�i�h�g�f�k ,0 findandreplaceintext findAndReplaceInText�j "0 striplinebreaks stripLineBreaks
�i .aevtoappnull  �   � ****�h 	0 debug  �g  �f  � �e;�d�c���b�e ,0 findandreplaceintext findAndReplaceInText�d �a��a �  �`�_�^�` 0 thetext theText�_ "0 thesearchstring theSearchString�^ ,0 thereplacementstring theReplacementString�c  � �]�\�[�Z�] 0 thetext theText�\ "0 thesearchstring theSearchString�[ ,0 thereplacementstring theReplacementString�Z 0 thetextitems theTextItems� �Y�X�W�V_
�Y 
ascr
�X 
txdl
�W 
citm
�V 
TEXT�b !���,FO��-E�O���,FO��&E�O���,FO�� �Ui�T�S���R�U "0 striplinebreaks stripLineBreaks�T �Q��Q �  �P�P 0 thetext theText�S  � �O�N�M�O 0 thetext theText�N 0 thetextitems theTextItems�M 0 newtext newText� �L�K�J�I�H�G�F�E�D�C��B
�L 
ret 
�K 
lnfd
�J 
cha �I )
�H kfrmID  �G (�F 
�E 
ascr
�D 
txdl
�C 
citm
�B 
TEXT�R -��%��)���0)���0�v��,FO��-E�O�kv��,FO��&E�O�� �A��@�?���>
�A .aevtoappnull  �   � ****� k    ���  ��  ��  ��  "��  -�=�=  �@  �?  � �<�;�:�< 0 anote aNote�; 0 eachparagraph eachParagraph�: 0 eachhighlight eachHighlight� T�9�8�7�6�5�4 )�33�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� � ����� �������#%��;=N�jmo�������������
�	�������� �� ��1�����9 	0 debug  
�8 .sysostdfalis    ��� null�7 0 	targetpdf 	targetPDF
�6 
psxp
�5 
ctxt�4 0 filepath filePath�3 0 filelink fileLink
�2 .aevtodocnull  �    alis�1 0 thedocument theDocument
�0 .SKIMConvnull���     docu�/ 0 cardlist cardList
�. 
Note
�- 
kocl
�, 
cobj
�+ .corecnte****       ****
�* .SKIMPagsnull���     ****�) 0 apage aPage
�( 
cpar�' $0 listofparagraphs listOfParagraphs�& "0 paragraphnumber paragraphNumber
�% 
rtyp
�$ 
utf8
�# .SKIMTextnull���     ****�" 0 notetext noteText
�! .SKIMFindnull���     docu�  (0 highlightselection highlightSelection� $0 paragraphexcerpt paragraphExcerpt� ,0 findandreplaceintext findAndReplaceInText� ,0 paragraphexcerptitem paragraphExcerptItem
� 
DInf� 0 infolist infoList� 0 documentinfo documentInfo
� 
atfn� $0 documentfilename documentFilename
� 
titl� 0 documenttitle documentTitle
� 
msng
� 
Auth�  0 documentauthor documentAuthor
� .SKIMIndxnull���     ****� "0 striplinebreaks stripLineBreaks
� .ascrcmnt****      � ****�  �  
� afdrcusr
� .earsffdralis        afdr� 0 
homefolder 
homeFolder�
 0 notesfilepath notesFilePath
�	 
perm
� .rdwropenshor       file� 0 	notesfile 	notesFile
� 
refn
� 
as  � 
� .rdwrwritnull���     ****
� .rdwrclosnull���     ****� 0 ankipath ankiPath
�  
usin
�� .sysodelanull��� ��� nmbr
�� 
alis
�� .coredelonull���     ditm�>�fE�O*j E�O��,�&E�O��%E�O���j 	E�O�j OjvE�O���-[��l kh  �j �i/E` O_ a -E` OjE` O�a a l E` Op_ [��l kh _ kE` O�_ I��_ l E` O��l E` O!)_ �&_ �&a m+ E` O�a  ,E` !Oa "E` #O_ !a $,E` %O_ #a &%_ %%a '%E` #O_ !a (,E` )O_ )a * _ #a +%_ )%a ,%E` #Y hO_ !a -,E` .O_ .a * _ #a /%_ .%a 0%E` #Y hO_ #a 1%_ j 2%E` #O_ a 3%_ %a 4%_ #%a 5%�%E` O)_ k+ 6E` O_ �6GO� ,a 7j 8Oa 9_ %j 8Oa :_ %j 8Oa ;j 8Y hOPW X < =hOPY h[OY��[OY�ZOa >j ?E` @Oa >a �l ?a A%E` BO_ Ba Cel Da &E` EO =�[��l kh �a F_ Ea Ga a H IOa Ja F_ Ea Ga a H I[OY��O_ Ej KOa L /_ Bj 8O a Mj ?E` NO_ Ba O_ Nl 	W X < =hUOmj POa Q *a R_ B/j SUOPU
�n boovfals�m  �l  ascr  ��ޭ