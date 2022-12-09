


# format:
# File: [name size]
# Dir:  [name [...Dirs] [...File]]
# ex:
# [
#     '/'                             # dir name              '/'
#     [                               # sub-dirs
#         [ 
#             'a'                     # sub-dir name          '/a'
#             [                       # sub-sub-dirs
#               [
#                   'b'               # sub-sub dir name      '/a/b'
#                   []                # sub-sub-sub-dirs
#                   [                 # sub-sub-sub-files
#                       ['f' 100]     # file-name size        '/a/b/f' = 100
#                       ['z' 200]     # file-name size        '/a/b/z' = 200
#                   ]
#               ] 
#             ] 
#             []                    # sub-files
#         ]
#     ]
#     [
#         ['r' 300]                   # file-name size        '/r' = 300
#         ['q' 400]                   # file-name size        '/q' = 400
#     ]
# ]
# 

stack: 