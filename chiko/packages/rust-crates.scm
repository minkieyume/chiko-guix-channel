(define-module (chiko packages rust-crates)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (gnu packages rust-sources)
  #:export (lookup-cargo-inputs))

(define rust-addr2line-0.25.1
  (crate-source "addr2line" "0.25.1"
                "0jwb96gv17vdr29hbzi0ha5q6jkpgjyn7rjlg5nis65k41rk0p8v"))

(define rust-adler2-2.0.1
  (crate-source "adler2" "2.0.1"
                "1ymy18s9hs7ya1pjc9864l30wk8p2qfqdi7mhhcc5nfakxbij09j"))

(define rust-adler32-1.2.0
  (crate-source "adler32" "1.2.0"
                "0d7jq7jsjyhsgbhnfq5fvrlh9j0i9g1fqrl2735ibv5f75yjgqda"))

(define rust-aead-0.5.2
  (crate-source "aead" "0.5.2"
                "1c32aviraqag7926xcb9sybdm36v5vh9gnxpn4pxdwjc50zl28ni"))

(define rust-aes-0.8.4
  (crate-source "aes" "0.8.4"
                "1853796anlwp4kqim0s6wm1srl4ib621nm0cl2h3c8klsjkgfsdi"))

(define rust-aes-gcm-0.10.3
  (crate-source "aes-gcm" "0.10.3"
                "1lgaqgg1gh9crg435509lqdhajg1m2vgma6f7fdj1qa2yyh10443"))

(define rust-aes-gcm-siv-0.11.1
  (crate-source "aes-gcm-siv" "0.11.1"
                "039ycyz9hijvrv2hiks9a1099yprqpkk3v39shb58dx99c9q81xf"))

(define rust-ahash-0.8.12
  (crate-source "ahash" "0.8.12"
                "0xbsp9rlm5ki017c0w6ay8kjwinwm8knjncci95mii30rmwz25as"))

(define rust-aho-corasick-1.1.3
  (crate-source "aho-corasick" "1.1.3"
                "05mrpkvdgp5d20y2p989f187ry9diliijgwrs254fs9s1m1x6q4f"))

(define rust-allocator-api2-0.2.21
  (crate-source "allocator-api2" "0.2.21"
                "08zrzs022xwndihvzdn78yqarv2b9696y67i6h78nla3ww87jgb8"))

(define rust-android-system-properties-0.1.5
  (crate-source "android_system_properties" "0.1.5"
                "04b3wrz12837j7mdczqd95b732gw5q7q66cv4yn4646lvccp57l1"))

(define rust-anstream-0.6.21
  (crate-source "anstream" "0.6.21"
                "0jjgixms4qjj58dzr846h2s29p8w7ynwr9b9x6246m1pwy0v5ma3"))

(define rust-anstyle-1.0.13
  (crate-source "anstyle" "1.0.13"
                "0y2ynjqajpny6q0amvfzzgw0gfw3l47z85km4gvx87vg02lcr4ji"))

(define rust-anstyle-parse-0.2.7
  (crate-source "anstyle-parse" "0.2.7"
                "1hhmkkfr95d462b3zf6yl2vfzdqfy5726ya572wwg8ha9y148xjf"))

(define rust-anstyle-query-1.1.4
  (crate-source "anstyle-query" "1.1.4"
                "1qir6d6fl5a4y2gmmw9a5w93ckwx6xn51aryd83p26zn6ihiy8wy"))

(define rust-anstyle-wincon-3.0.10
  (crate-source "anstyle-wincon" "3.0.10"
                "0ajz9wsf46a2l3pds7v62xbhq2cffj7wrilamkx2z8r28m0k61iy"))

(define rust-anyhow-1.0.100
  (crate-source "anyhow" "1.0.100"
                "0qbfmw4hhv2ampza1csyvf1jqjs2dgrj29cv3h3sh623c6qvcgm2"))

(define rust-arbitrary-1.4.2
  (crate-source "arbitrary" "1.4.2"
                "1wcbi4x7i3lzcrkjda4810nqv03lpmvfhb0a85xrq1mbqjikdl63"))

(define rust-arc-swap-1.7.1
  (crate-source "arc-swap" "1.7.1"
                "0mrl9a9r9p9bln74q6aszvf22q1ijiw089jkrmabfqkbj31zixv9"))

(define rust-argon2-0.5.3
  (crate-source "argon2" "0.5.3"
                "0wn0kk97k49wxidfigmz1pdqmygqzi4h6w72ib7cpq765s4i0diw"))

(define rust-array-init-2.1.0
  (crate-source "array-init" "2.1.0"
                "1z0bh6grrkxlbknq3xyipp42rasngi806y92fiddyb2n99lvfqix"))

(define rust-arrayref-0.3.9
  (crate-source "arrayref" "0.3.9"
                "1jzyp0nvp10dmahaq9a2rnxqdd5wxgbvp8xaibps3zai8c9fi8kn"))

(define rust-arrayvec-0.7.6
  (crate-source "arrayvec" "0.7.6"
                "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw"))

(define rust-ascii-canvas-3.0.0
  (crate-source "ascii-canvas" "3.0.0"
                "1in38ziqn4kh9sw89ys4naaqzvvjscfs0m4djqbfq7455v5fq948"))

(define rust-asn1-rs-0.7.1
  (crate-source "asn1-rs" "0.7.1"
                "0q0ydbjh2cawwic3r9rfk6lyas2qnj6f2aiic5nw5f1bi2b4lqjn"))

(define rust-asn1-rs-derive-0.6.0
  (crate-source "asn1-rs-derive" "0.6.0"
                "0b7fpyjs2kyb2i922br5mbg8rml46rihr8qmcpdyj2a93sdy829i"))

(define rust-asn1-rs-impl-0.2.0
  (crate-source "asn1-rs-impl" "0.2.0"
                "1xv56m0wrwix4av3w86sih1nsa5g1dgfz135lz1qdznn5h60a63v"))

(define rust-async-channel-1.9.0
  (crate-source "async-channel" "1.9.0"
                "0dbdlkzlncbibd3ij6y6jmvjd0cmdn48ydcfdpfhw09njd93r5c1"))

(define rust-async-compression-0.4.32
  (crate-source "async-compression" "0.4.32"
                "1q7l15lwlc1ral2bi8a4d88a4rha12xgnci4mish4wjc0pkbr2as"))

(define rust-async-lock-3.4.1
  (crate-source "async-lock" "3.4.1"
                "1p6i1sw3mwv1msdx9jqkr0h0a2jlrp3717yyx5n9pvkw0h23dl2z"))

(define rust-async-nats-0.44.2
  (crate-source "async-nats" "0.44.2"
                "0hk79yhcq8vbgkh6q6w3iq41xwwcawd6d9jwiyf9n45n786ahd7q"))

(define rust-async-recursion-1.1.1
  (crate-source "async-recursion" "1.1.1"
                "04ac4zh8qz2xjc79lmfi4jlqj5f92xjvfaqvbzwkizyqd4pl4hrv"))

(define rust-async-stream-0.3.6
  (crate-source "async-stream" "0.3.6"
                "0xl4zqncrdmw2g6241wgr11dxdg4h7byy6bz3l6si03qyfk72nhb"))

(define rust-async-stream-impl-0.3.6
  (crate-source "async-stream-impl" "0.3.6"
                "0kaplfb5axsvf1gfs2gk6c4zx6zcsns0yf3ssk7iwni7bphlvhn7"))

(define rust-async-trait-0.1.89
  (crate-source "async-trait" "0.1.89"
                "1fsxxmz3rzx1prn1h3rs7kyjhkap60i7xvi0ldapkvbb14nssdch"))

(define rust-atomic-waker-1.1.2
  (crate-source "atomic-waker" "1.1.2"
                "1h5av1lw56m0jf0fd3bchxq8a30xv0b4wv8s4zkp4s0i7mfvs18m"))

(define rust-attohttpc-0.28.5
  (crate-source "attohttpc" "0.28.5"
                "18sngzd1q9ifh9gbjpwb45vzkqxfvfdc552hjf8gqf87p92v5a87"))

(define rust-autocfg-1.5.0
  (crate-source "autocfg" "1.5.0"
                "1s77f98id9l4af4alklmzq46f21c980v13z2r1pcxx6bqgw0d1n0"))

(define rust-aws-creds-0.37.0
  (crate-source "aws-creds" "0.37.0"
                "1q0v2cwpjrgcvl7jjn8mrmwrqly7c3g1am5nbhy2pixr0qr1913z"))

(define rust-aws-region-0.25.5
  (crate-source "aws-region" "0.25.5"
                "0fwv8lpp1fi70d7ysky6yw9fhl8r9l7kpnrgcqlbxjgaqzwx7bp9"))

(define rust-azure-core-0.21.0
  (crate-source "azure_core" "0.21.0"
                "17kjnykbcphnki1lnh89j9sv8rk4zcfsbly33r34d9s57ba2lmbv"))

(define rust-azure-storage-0.21.0
  (crate-source "azure_storage" "0.21.0"
                "09ki28al97mz2rspmc7ycjp9b94baxbxgn8l190cnaadkwakiy2r"))

(define rust-azure-storage-blobs-0.21.0
  (crate-source "azure_storage_blobs" "0.21.0"
                "1r57wsig0kzmdzh0ri8m768b77miwc922awnlykdk1mf6qv3rs4p"))

(define rust-azure-svc-blobstorage-0.21.0
  (crate-source "azure_svc_blobstorage" "0.21.0"
                "1ik483zkb33yazp8mjxfh5rjd6l409gawyscm5dqh6v1qlh6yv2f"))

(define rust-backtrace-0.3.76
  (crate-source "backtrace" "0.3.76"
                "1mibx75x4jf6wz7qjifynld3hpw3vq6sy3d3c9y5s88sg59ihlxv"))

(define rust-base16ct-0.2.0
  (crate-source "base16ct" "0.2.0"
                "1kylrjhdzk7qpknrvlphw8ywdnvvg39dizw9622w3wk5xba04zsc"))

(define rust-base32-0.5.1
  (crate-source "base32" "0.5.1"
                "0xp0a3xml25xw2bp5pyac2nld7vmmfjl02qynnyfn6aznfggwb82"))

(define rust-base64-0.11.0
  (crate-source "base64" "0.11.0"
                "1iqmims6yvr6vwzyy54qd672zw29ipjj17p8klcr578c9ajpw6xl"))

(define rust-base64-0.13.1
  (crate-source "base64" "0.13.1"
                "1s494mqmzjb766fy1kqlccgfg2sdcjb6hzbvzqv2jw65fdi5h6wy"))

(define rust-base64-0.21.7
  (crate-source "base64" "0.21.7"
                "0rw52yvsk75kar9wgqfwgb414kvil1gn7mqkrhn9zf1537mpsacx"))

(define rust-base64-0.22.1
  (crate-source "base64" "0.22.1"
                "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj"))

(define rust-base64ct-1.8.0
  (crate-source "base64ct" "1.8.0"
                "1fj4vc6ghy3j1120r7dwn4xw90crfy46b448g5pm9w6an13qn92m"))

(define rust-bincode-1.3.3
  (crate-source "bincode" "1.3.3"
                "1bfw3mnwzx5g1465kiqllp5n4r10qrqy88kdlp3jfwnq2ya5xx5i"))

(define rust-bincode-2.0.1
  (crate-source "bincode" "2.0.1"
                "0h5pxp3dqkigjwy926a03sl69n9wv7aq4142a20kw9lhn3bzbsin"))

(define rust-bincode-derive-2.0.1
  (crate-source "bincode_derive" "2.0.1"
                "029wmh26hq3hhs1gq629y0frn2pkl7ld061rk23fji8g8jd715dz"))

(define rust-bindgen-0.70.1
  (crate-source "bindgen" "0.70.1"
                "0vyf0jp6apcy9kjyz4s8vldj0xqycnbzb6zv3skkwiqdi3nqz7gl"))

(define rust-bindgen-0.72.1
  (crate-source "bindgen" "0.72.1"
                "15bq73y3wd3x3vxh3z3g72hy08zs8rxg1f0i1xsrrd6g16spcdwr"))

(define rust-biscuit-0.7.0
  (crate-source "biscuit" "0.7.0"
                "0nn07yij0rccpgaa58rf0d7qm2ynzvj766qd3nh465y6arygqa3y"))

(define rust-bit-set-0.5.3
  (crate-source "bit-set" "0.5.3"
                "1wcm9vxi00ma4rcxkl3pzzjli6ihrpn9cfdi0c5b4cvga2mxs007"))

(define rust-bit-set-0.8.0
  (crate-source "bit-set" "0.8.0"
                "18riaa10s6n59n39vix0cr7l2dgwdhcpbcm97x1xbyfp1q47x008"))

(define rust-bit-vec-0.6.3
  (crate-source "bit-vec" "0.6.3"
                "1ywqjnv60cdh1slhz67psnp422md6jdliji6alq0gmly2xm9p7rl"))

(define rust-bit-vec-0.8.0
  (crate-source "bit-vec" "0.8.0"
                "1xxa1s2cj291r7k1whbxq840jxvmdsq9xgh7bvrxl46m80fllxjy"))

(define rust-bitflags-1.3.2
  (crate-source "bitflags" "1.3.2"
                "12ki6w8gn1ldq7yz9y680llwk5gmrhrzszaa17g1sbrw2r2qvwxy"))

(define rust-bitflags-2.10.0
  (crate-source "bitflags" "2.10.0"
                "1lqxwc3625lcjrjm5vygban9v8a6dlxisp1aqylibiaw52si4bl1"))

(define rust-bitpacking-0.9.2
  (crate-source "bitpacking" "0.9.2"
                "14pa6bksmxjsqq6v1rw50fhzz3hqqfpifywz2y5081ldzlmkw7ac"))

(define rust-bitvec-1.0.1
  (crate-source "bitvec" "1.0.1"
                "173ydyj2q5vwj88k6xgjnfsshs4x9wbvjjv7sm0h36r34hn87hhv"))

(define rust-bitvec-nom2-0.2.1
  (crate-source "bitvec-nom2" "0.2.1"
                "1w552jx8s4nn5bc7yr42hl0jkgcaiyh7an65xn2smkjm032gr26r"))

(define rust-blake2-0.10.6
  (crate-source "blake2" "0.10.6"
                "1zlf7w7gql12v61d9jcbbswa3dw8qxsjglylsiljp9f9b3a2ll26"))

(define rust-blake3-1.8.2
  (crate-source "blake3" "1.8.2"
                "1854x65zmjh9w9cfhyyyg0wmm2k5d87l13l4m7y40ajbkslam21q"))

(define rust-block-buffer-0.10.4
  (crate-source "block-buffer" "0.10.4"
                "0w9sa2ypmrsqqvc20nhwr75wbb5cjr4kkyhpjm1z1lv2kdicfy1h"))

(define rust-block-buffer-0.9.0
  (crate-source "block-buffer" "0.9.0"
                "1r4pf90s7d7lj1wdjhlnqa26vvbm6pnc33z138lxpnp9srpi2lj1"))

(define rust-block-padding-0.3.3
  (crate-source "block-padding" "0.3.3"
                "14wdad0r1qk5gmszxqd8cky6vx8qg7c153jv981mixzrpzmlz2d8"))

(define rust-blowfish-0.7.0
  (crate-source "blowfish" "0.7.0"
                "0nwa0h9jkjgvvf1bwl1pnzbs6fz20g99dr02l2mppqr42436myij"))

(define rust-blowfish-0.9.1
  (crate-source "blowfish" "0.9.1"
                "1mw7bvj3bg5w8vh9xw9xawqh7ixk2xwsxkj34ph96b9b1z6y44p4"))

(define rust-btoi-0.4.3
  (crate-source "btoi" "0.4.3"
                "1bg02zgsv5njbhng9sq2b70przbazsczjbla5lbbdf59fdzl1mlx"))

(define rust-buffered-reader-1.4.0
  (crate-source "buffered-reader" "1.4.0"
                "0bs1q8vg61qgrs39ykhcybrvdbhm14ljzgmkb9dy1m9g14gvy9nv"))

(define rust-bumpalo-3.19.0
  (crate-source "bumpalo" "3.19.0"
                "0hsdndvcpqbjb85ghrhska2qxvp9i75q2vb70hma9fxqawdy9ia6"))

(define rust-bytecheck-0.8.2
  (crate-source "bytecheck" "0.8.2"
                "12yasgcsxapxnpiv2ac3jzvmc69zy3gj7isss4ch9jpdq2i37ahc"))

(define rust-bytecheck-derive-0.8.2
  (crate-source "bytecheck_derive" "0.8.2"
                "1ncjsg08a6kawhxhy24rpxn287yclbprbc7034i1v0ninn15wf49"))

(define rust-bytemuck-1.24.0
  (crate-source "bytemuck" "1.24.0"
                "1x65wc9kwf0dfnmglkl8r46d29pfl7yilll5wh9bcf0g6a0gbg8z"))

(define rust-byteorder-1.5.0
  (crate-source "byteorder" "1.5.0"
                "0jzncxyf404mwqdbspihyzpkndfgda450l0893pz5xj685cg5l0z"))

(define rust-bytes-1.10.1
  (crate-source "bytes" "1.10.1"
                "0smd4wi2yrhp5pmq571yiaqx84bjqlm1ixqhnvfwzzc6pqkn26yp"))

(define rust-bzip2-0.6.1
  (crate-source "bzip2" "0.6.1"
                "0v1lgjxy944fdvsl97wmqs7f288crv7xddalk6y82jpk4jn3z9gk"))

(define rust-bzip2-sys-0.1.13+1.0.8
  ;; TODO: Check bundled sources.
  (crate-source "bzip2-sys" "0.1.13+1.0.8"
                "056c39pgjh4272bdslv445f5ry64xvb0f7nph3z7860ln8rzynr2"))

(define rust-calcard-0.1.3
  (crate-source "calcard" "0.1.3"
                "0g1zds05q0bbq0ql3lz1h8pq32rhrc432xdh8gv7kw95vwm423kj"))

(define rust-calcard-0.3.1
  (crate-source "calcard" "0.3.1"
                "01b3f1l1i1i9vpshgfagss3pikb0mk78in6mkk3rr15ccymwhd9f"))

(define rust-camellia-0.1.0
  (crate-source "camellia" "0.1.0"
                "0c6f61rf0gzq7x9d2qmp0330pb397aldwdpmwqybbwly9rby4r1j"))

(define rust-cast5-0.11.1
  (crate-source "cast5" "0.11.1"
                "04crg8dj6lxbp3lmdc3filsahxcyvccvhm0gx40g1k5i7mkpvc16"))

(define rust-castaway-0.2.4
  (crate-source "castaway" "0.2.4"
                "0nn5his5f8q20nkyg1nwb40xc19a08yaj4y76a8q2y3mdsmm3ify"))

(define rust-cbc-0.1.2
  (crate-source "cbc" "0.1.2"
                "19l9y9ccv1ffg6876hshd123f2f8v7zbkc4nkckqycxf8fajmd96"))

(define rust-cc-1.2.41
  (crate-source "cc" "1.2.41"
                "1dvwli6fljqc7kgmihb249rmdfs5irla1h0n6vkavdi4pg6yd7xc"))

(define rust-cedarwood-0.4.6
  (crate-source "cedarwood" "0.4.6"
                "142fw2aj0c34v56bsml95v9cjlq88r3x5gnhccr7691csvnhp4bd"))

(define rust-cesu8-1.1.0
  (crate-source "cesu8" "1.1.0"
                "0g6q58wa7khxrxcxgnqyi9s1z2cjywwwd3hzr5c55wskhx6s0hvd"))

(define rust-cexpr-0.6.0
  (crate-source "cexpr" "0.6.0"
                "0rl77bwhs5p979ih4r0202cn5jrfsrbgrksp40lkfz5vk1x3ib3g"))

(define rust-cfb-0.7.3
  (crate-source "cfb" "0.7.3"
                "03y6p3dlm7gfds19bq4ba971za16rjbn7q2v0vqcri52l2kjv3yk"))

(define rust-cfb-mode-0.8.2
  (crate-source "cfb-mode" "0.8.2"
                "0c6kd34jk4p52vr0qgn9slj6zdgmc42gfcqr6mqhmy37g138v2vk"))

(define rust-cfg-aliases-0.2.1
  (crate-source "cfg_aliases" "0.2.1"
                "092pxdc1dbgjb6qvh83gk56rkic2n2ybm4yvy76cgynmzi3zwfk1"))

(define rust-cfg-if-1.0.4
  (crate-source "cfg-if" "1.0.4"
                "008q28ajc546z5p2hcwdnckmg0hia7rnx52fni04bwqkzyrghc4k"))

(define rust-chrono-0.4.42
  (crate-source "chrono" "0.4.42"
                "1lp8iz9js9jwxw0sj8yi59v54lgvwdvm49b9wch77f25sfym4l0l"))

(define rust-chrono-tz-0.10.4
  (crate-source "chrono-tz" "0.10.4"
                "1hr6rmdvqwgk748g2f69mnk97fzhdkfzaczvdn0wz4pdjy2rl4x6"))

(define rust-cipher-0.2.5
  (crate-source "cipher" "0.2.5"
                "00b8imbmdg7zdrbaczlivmdfdy09xldg95wl4iijl15xgjcfgy0j"))

(define rust-cipher-0.4.4
  (crate-source "cipher" "0.4.4"
                "1b9x9agg67xq5nq879z66ni4l08m6m3hqcshk37d4is4ysd3ngvp"))

(define rust-clang-sys-1.8.1
  ;; TODO: Check bundled sources.
  (crate-source "clang-sys" "1.8.1"
                "1x1r9yqss76z8xwpdanw313ss6fniwc1r7dzb5ycjn0ph53kj0hb"))

(define rust-clap-4.5.50
  (crate-source "clap" "4.5.50"
                "08qna2mzl9irqp0p3lbbn06pjiym0dsgwbz3lkd7s0d6z1xzsb0c"))

(define rust-clap-builder-4.5.50
  (crate-source "clap_builder" "4.5.50"
                "1867h9y6fxbh35bv3f45m40grmm7ddxsv07hgqxcsp0cx2whak0a"))

(define rust-clap-derive-4.5.49
  (crate-source "clap_derive" "4.5.49"
                "0wbngw649138v3jwx8pm5x9sq0qsml3sh0sfzyrdxcpamy3m82ra"))

(define rust-clap-lex-0.7.6
  (crate-source "clap_lex" "0.7.6"
                "13cxw9m2rqvplgazgkq2awms0rgf34myc19bz6gywfngi762imx1"))

(define rust-cmac-0.7.2
  (crate-source "cmac" "0.7.2"
                "1an1vcala24grlyhvk71ikxk2kmgcbal9kgrzzpjcl9z7i74ahw5"))

(define rust-cmake-0.1.54
  (crate-source "cmake" "0.1.54"
                "1w41ma28yzad9x757s9sfq1wigjs9j902hbzc0nbxpc9vvws7jp7"))

(define rust-colorchoice-1.0.4
  (crate-source "colorchoice" "1.0.4"
                "0x8ymkz1xr77rcj1cfanhf416pc4v681gmkc9dzb3jqja7f62nxh"))

(define rust-combine-4.6.7
  (crate-source "combine" "4.6.7"
                "1z8rh8wp59gf8k23ar010phgs0wgf5i8cx4fg01gwcnzfn5k0nms"))

(define rust-compact-str-0.9.0
  (crate-source "compact_str" "0.9.0"
                "0ykhh2scg32lmzxak107pmby6fmnz7qbhsi9i8g9iknfl4ji7nrz"))

(define rust-compression-codecs-0.4.31
  (crate-source "compression-codecs" "0.4.31"
                "08rdpxad4azmc20rj3wlgqypvm9nsvmclwpmk03lc75qqip512pg"))

(define rust-compression-core-0.4.29
  (crate-source "compression-core" "0.4.29"
                "1fswgrwvlzqk3g45akdzygm7bqi5b5rm87xc70aznhdgvv9l2xp4"))

(define rust-concurrent-queue-2.5.0
  (crate-source "concurrent-queue" "2.5.0"
                "0wrr3mzq2ijdkxwndhf79k952cp4zkz35ray8hvsxl96xrx1k82c"))

(define rust-console-0.15.11
  (crate-source "console" "0.15.11"
                "1n5gmsjk6isbnw6qss043377kln20lfwlmdk3vswpwpr21dwnk05"))

(define rust-const-format-0.2.35
  (crate-source "const_format" "0.2.35"
                "1b9h03z3k76ail1ldqxcqmsc4raa7dwgwwqwrjf6wmism5lp9akz"))

(define rust-const-format-proc-macros-0.2.34
  (crate-source "const_format_proc_macros" "0.2.34"
                "0i3pxxcl4xvwq4mlfg3csb4j0n6v0mhj07p6yk0vlvdirznc4mqx"))

(define rust-const-oid-0.9.6
  (crate-source "const-oid" "0.9.6"
                "1y0jnqaq7p2wvspnx7qj76m7hjcqpz73qzvr9l2p9n2s51vr6if2"))

(define rust-const-panic-0.2.15
  (crate-source "const_panic" "0.2.15"
                "0lp6i96dnbpal6k6zdmlpmwa2zgbrpwnjff46jpf7514qjmcsqp2"))

(define rust-const-random-0.1.18
  (crate-source "const-random" "0.1.18"
                "0n8kqz3y82ks8znvz1mxn3a9hadca3amzf33gmi6dc3lzs103q47"))

(define rust-const-random-macro-0.1.16
  (crate-source "const-random-macro" "0.1.16"
                "03iram4ijjjq9j5a7hbnmdngj8935wbsd0f5bm8yw2hblbr3kn7r"))

(define rust-constant-time-eq-0.3.1
  (crate-source "constant_time_eq" "0.3.1"
                "19nwwczii762pwlsm7bpizgjg8hkg1kqi32b2g4rglijklsbhx3w"))

(define rust-core-foundation-0.10.1
  (crate-source "core-foundation" "0.10.1"
                "1xjns6dqf36rni2x9f47b65grxwdm20kwdg9lhmzdrrkwadcv9mj"))

(define rust-core-foundation-0.9.4
  (crate-source "core-foundation" "0.9.4"
                "13zvbbj07yk3b61b8fhwfzhy35535a583irf23vlcg59j7h9bqci"))

(define rust-core-foundation-sys-0.8.7
  ;; TODO: Check bundled sources.
  (crate-source "core-foundation-sys" "0.8.7"
                "12w8j73lazxmr1z0h98hf3z623kl8ms7g07jch7n4p8f9nwlhdkp"))

(define rust-core2-0.4.0
  (crate-source "core2" "0.4.0"
                "01f5xv0kf3ds3xm7byg78hycbanb8zlpvsfv4j47y46n3bpsg6xl"))

(define rust-cpufeatures-0.2.17
  (crate-source "cpufeatures" "0.2.17"
                "10023dnnaghhdl70xcds12fsx2b966sxbxjq5sxs49mvxqw5ivar"))

(define rust-crc-3.3.0
  (crate-source "crc" "3.3.0"
                "0xg6yg57lbyzf69y8znq5gjb333w1fnlis2gnjg38blwffrx644p"))

(define rust-crc-catalog-2.4.0
  (crate-source "crc-catalog" "2.4.0"
                "1xg7sz82w3nxp1jfn425fvn1clvbzb3zgblmxsyqpys0dckp9lqr"))

(define rust-crc16-0.4.0
  (crate-source "crc16" "0.4.0"
                "1zzwb5iv51wnh96532cxkk4aa8ys47rhzrjy98wqcys25ks8k01k"))

(define rust-crc32fast-1.5.0
  (crate-source "crc32fast" "1.5.0"
                "04d51liy8rbssra92p0qnwjw8i9rm9c4m3bwy19wjamz1k4w30cl"))

(define rust-critical-section-1.2.0
  (crate-source "critical-section" "1.2.0"
                "02ylhcykxjc40xrfhk1lwc21jqgz4dbwv3jr49ymw733c51yl3kr"))

(define rust-crossbeam-0.8.4
  (crate-source "crossbeam" "0.8.4"
                "1a5c7yacnk723x0hfycdbl91ks2nxhwbwy46b8y5vyy0gxzcsdqi"))

(define rust-crossbeam-channel-0.5.15
  (crate-source "crossbeam-channel" "0.5.15"
                "1cicd9ins0fkpfgvz9vhz3m9rpkh6n8d3437c3wnfsdkd3wgif42"))

(define rust-crossbeam-deque-0.8.6
  (crate-source "crossbeam-deque" "0.8.6"
                "0l9f1saqp1gn5qy0rxvkmz4m6n7fc0b3dbm6q1r5pmgpnyvi3lcx"))

(define rust-crossbeam-epoch-0.9.18
  (crate-source "crossbeam-epoch" "0.9.18"
                "03j2np8llwf376m3fxqx859mgp9f83hj1w34153c7a9c7i5ar0jv"))

(define rust-crossbeam-queue-0.3.12
  (crate-source "crossbeam-queue" "0.3.12"
                "059igaxckccj6ndmg45d5yf7cm4ps46c18m21afq3pwiiz1bnn0g"))

(define rust-crossbeam-utils-0.8.21
  (crate-source "crossbeam-utils" "0.8.21"
                "0a3aa2bmc8q35fb67432w16wvi54sfmb69rk9h5bhd18vw0c99fh"))

(define rust-crunchy-0.2.4
  (crate-source "crunchy" "0.2.4"
                "1mbp5navim2qr3x48lyvadqblcxc1dm0lqr0swrkkwy2qblvw3s6"))

(define rust-crypto-bigint-0.5.5
  (crate-source "crypto-bigint" "0.5.5"
                "0xmbdff3g6ii5sbxjxc31xfkv9lrmyril4arh3dzckd4gjsjzj8d"))

(define rust-crypto-common-0.1.6
  (crate-source "crypto-common" "0.1.6"
                "1cvby95a6xg7kxdz5ln3rl9xh66nz66w46mm3g56ri1z5x815yqv"))

(define rust-crypto-mac-0.10.0
  (crate-source "crypto-mac" "0.10.0"
                "19iyh7h9qaqrv29dhbd31rm6pq023ry78nw7jwr3qjy3l22zsms8"))

(define rust-csv-1.4.0
  (crate-source "csv" "1.4.0"
                "0f7r2ip0rbi7k377c3xmsh9xd69sillffhpfmbgnvz3yrxl9vkaj"))

(define rust-csv-core-0.1.13
  (crate-source "csv-core" "0.1.13"
                "10lppd3fdb1i5npgx9xqjs5mjmy2qbdi8n16i48lg03ak4k3qjkh"))

(define rust-ctr-0.9.2
  (crate-source "ctr" "0.9.2"
                "0d88b73waamgpfjdml78icxz45d95q7vi2aqa604b0visqdfws83"))

(define rust-curve25519-dalek-4.1.3
  (crate-source "curve25519-dalek" "4.1.3"
                "1gmjb9dsknrr8lypmhkyjd67p1arb8mbfamlwxm7vph38my8pywp"))

(define rust-curve25519-dalek-derive-0.1.1
  (crate-source "curve25519-dalek-derive" "0.1.1"
                "1cry71xxrr0mcy5my3fb502cwfxy6822k4pm19cwrilrg7hq4s7l"))

(define rust-darling-0.13.4
  (crate-source "darling" "0.13.4"
                "0g25pad4mhq7315mw9n4wpg8j3mwyhwvr541kgdl0aar1j2ra7d0"))

(define rust-darling-0.20.11
  (crate-source "darling" "0.20.11"
                "1vmlphlrlw4f50z16p4bc9p5qwdni1ba95qmxfrrmzs6dh8lczzw"))

(define rust-darling-0.21.3
  (crate-source "darling" "0.21.3"
                "1h281ah78pz05450r71h3gwm2n24hy8yngbz58g426l4j1q37pww"))

(define rust-darling-core-0.13.4
  (crate-source "darling_core" "0.13.4"
                "046n83f9jpszlngpjxkqi39ayzxf5a35q673c69jr1dn0ylnb7c5"))

(define rust-darling-core-0.20.11
  (crate-source "darling_core" "0.20.11"
                "0bj1af6xl4ablnqbgn827m43b8fiicgv180749f5cphqdmcvj00d"))

(define rust-darling-core-0.21.3
  (crate-source "darling_core" "0.21.3"
                "193ya45qgac0a4siwghk0bl8im8h89p3cald7kw8ag3yrmg1jiqj"))

(define rust-darling-macro-0.13.4
  (crate-source "darling_macro" "0.13.4"
                "0d8q8ibmsb1yzby6vwgh2wx892jqqfv9clwhpm19rprvz1wjd5ww"))

(define rust-darling-macro-0.20.11
  (crate-source "darling_macro" "0.20.11"
                "1bbfbc2px6sj1pqqq97bgqn6c8xdnb2fmz66f7f40nrqrcybjd7w"))

(define rust-darling-macro-0.21.3
  (crate-source "darling_macro" "0.21.3"
                "10ac85n4lnx3rmf5rw8lijl2c0sbl6ghcpgfmzh0s26ihbghi0yk"))

(define rust-dary-heap-0.3.8
  (crate-source "dary_heap" "0.3.8"
                "010zfln7257vq9fsgcslkqs5gmcm1ahrri118bkhgh7igllf7lh6"))

(define rust-data-encoding-2.9.0
  (crate-source "data-encoding" "2.9.0"
                "0xm46371aw613ghc12ay4vsnn49hpcmcwlijnqy8lbp2bpd308ra"))

(define rust-dbl-0.3.2
  (crate-source "dbl" "0.3.2"
                "1ng33ncai537xlxfy9r4v24parm9mf7zwiwkixq7d0qmj6kka9xx"))

(define rust-deadpool-0.10.0
  (crate-source "deadpool" "0.10.0"
                "145lq79dlc4jn7jvlcf4lb105bs3z3jy6g7d15zv7iy1g04i117v"))

(define rust-deadpool-0.12.3
  (crate-source "deadpool" "0.12.3"
                "06wvsfyni5f04ia6jczgjnpkq4w91cnjjdz10mpq93gcsv8v3qhb"))

(define rust-deadpool-postgres-0.14.1
  (crate-source "deadpool-postgres" "0.14.1"
                "1ydyw2khdjx3v7l39h580v4xjgc8s4gspjml7v11i85zdhvpss9x"))

(define rust-deadpool-runtime-0.1.4
  (crate-source "deadpool-runtime" "0.1.4"
                "0arbchl5j887hcfvjy4gq38d32055s5cf7pkpmwn0lfw3ss6ca89"))

(define rust-decancer-3.3.3
  (crate-source "decancer" "3.3.3"
                "07ca7frh5lwwvv8x1lq9kcdwindrrni63j0syj5ifiwn28il6959"))

(define rust-deflate64-0.1.10
  (crate-source "deflate64" "0.1.10"
                "012jmx4jrxwdk5d6fbnnxih4zdq9nb0vmjzhqasjkvf5a71qzgr6"))

(define rust-der-0.7.10
  (crate-source "der" "0.7.10"
                "1jyxacyxdx6mxbkfw99jz59dzvcd9k17rq01a7xvn1dr6wl87hg7"))

(define rust-der-parser-10.0.0
  (crate-source "der-parser" "10.0.0"
                "19n13gjidjcbj23ps6fww322zx8mz4kfs4cvsd6kqnjx84b51nh7"))

(define rust-deranged-0.5.4
  (crate-source "deranged" "0.5.4"
                "0wch36gpg2crz2f72p7c0i5l4bzxjkwxw96sdj57c1cadzw566d4"))

(define rust-derive-arbitrary-1.4.2
  (crate-source "derive_arbitrary" "1.4.2"
                "0annkmfwfavd978vwwrxvrpykjfdnc3w6q1ln3j7kyfg5pc7nmhy"))

(define rust-des-0.8.1
  (crate-source "des" "0.8.1"
                "07kshslxanmg0g6007scvglfhg6mli2a8qzhx4kxx4z9ik781pgz"))

(define rust-digest-0.10.7
  (crate-source "digest" "0.10.7"
                "14p2n6ih29x81akj097lvz7wi9b6b9hvls0lwrv7b6xwyy0s5ncy"))

(define rust-digest-0.9.0
  (crate-source "digest" "0.9.0"
                "0rmhvk33rgvd6ll71z8sng91a52rw14p0drjn1da0mqa138n1pfk"))

(define rust-dirs-6.0.0
  (crate-source "dirs" "6.0.0"
                "0knfikii29761g22pwfrb8d0nqpbgw77sni9h2224haisyaams63"))

(define rust-dirs-next-2.0.0
  (crate-source "dirs-next" "2.0.0"
                "1q9kr151h9681wwp6is18750ssghz6j9j7qm7qi1ngcwy7mzi35r"))

(define rust-dirs-sys-0.5.0
  ;; TODO: Check bundled sources.
  (crate-source "dirs-sys" "0.5.0"
                "1aqzpgq6ampza6v012gm2dppx9k35cdycbj54808ksbys9k366p0"))

(define rust-dirs-sys-next-0.1.2
  (crate-source "dirs-sys-next" "0.1.2"
                "0kavhavdxv4phzj4l0psvh55hszwnr0rcz8sxbvx20pyqi2a3gaf"))

(define rust-displaydoc-0.2.5
  (crate-source "displaydoc" "0.2.5"
                "1q0alair462j21iiqwrr21iabkfnb13d6x5w95lkdg21q2xrqdlp"))

(define rust-dlv-list-0.5.2
  (crate-source "dlv-list" "0.5.2"
                "0pqvrinxzdz7bpy4a3p450h8krns3bd0mc3w0qqvm03l2kskj824"))

(define rust-dns-update-0.1.5
  (crate-source "dns-update" "0.1.5"
                "1cnyjs9s5qb0py44ihl1lx186qmzp5nl132h8rn68713l4hqny22"))

(define rust-doc-comment-0.3.3
  (crate-source "doc-comment" "0.3.3"
                "043sprsf3wl926zmck1bm7gw0jq50mb76lkpk49vasfr6ax1p97y"))

(define rust-dsa-0.6.3
  (crate-source "dsa" "0.6.3"
                "12bn5d0nnni4mlla24m3bwi4mhy2nfmyak2qjl0pdbc4j1525g28"))

(define rust-dyn-clone-1.0.20
  (crate-source "dyn-clone" "1.0.20"
                "0m956cxcg8v2n8kmz6xs5zl13k2fak3zkapzfzzp7pxih6hix26h"))

(define rust-eax-0.5.0
  (crate-source "eax" "0.5.0"
                "0a5cpzk577f1lw3wkk20iqvavnbdr5yzjrcglvbvk0ivj2yzlm4r"))

(define rust-ecb-0.1.2
  (crate-source "ecb" "0.1.2"
                "1iw1i0mwkvg3599mlw24iibid6i6zv3a3jhghm2j3v0sbfbzm2qs"))

(define rust-ecdsa-0.16.9
  (crate-source "ecdsa" "0.16.9"
                "1jhb0bcbkaz4001sdmfyv8ajrv8a1cg7z7aa5myrd4jjbhmz69zf"))

(define rust-ece-2.3.1
  (crate-source "ece" "2.3.1"
                "0ijpzz7sp2971hrdcf33nsx4jia9pgjxhx959rx9ax695hpivsn2"))

(define rust-ed25519-2.2.3
  (crate-source "ed25519" "2.2.3"
                "0lydzdf26zbn82g7xfczcac9d7mzm3qgx934ijjrd5hjpjx32m8i"))

(define rust-ed25519-dalek-2.2.0
  (crate-source "ed25519-dalek" "2.2.0"
                "1agcwij1z687hg26ngzwhnmpz29b2w56m8z1ap3pvrnfh709drvh"))

(define rust-either-1.15.0
  (crate-source "either" "1.15.0"
                "069p1fknsmzn9llaizh77kip0pqmcwpdsykv2x30xpjyija5gis8"))

(define rust-elasticsearch-8.5.0-alpha.1
  (crate-source "elasticsearch" "8.5.0-alpha.1"
                "1im6fkw0ic2hp6nsai06qdj5npbvxmiqy2cghz76dk0lv5bvvna0"))

(define rust-elliptic-curve-0.13.8
  (crate-source "elliptic-curve" "0.13.8"
                "0ixx4brgnzi61z29r3g1606nh2za88hzyz8c5r3p6ydzhqq09rmm"))

(define rust-ena-0.14.3
  (crate-source "ena" "0.14.3"
                "1m9a5hqk6qn5sqnrc40b55yr97drkfdzd0jj863ksqff8gfqn91x"))

(define rust-encode-unicode-1.0.0
  (crate-source "encode_unicode" "1.0.0"
                "1h5j7j7byi289by63s3w4a8b3g6l5ccdrws7a67nn07vdxj77ail"))

(define rust-encoding-rs-0.8.35
  (crate-source "encoding_rs" "0.8.35"
                "1wv64xdrr9v37rqqdjsyb8l8wzlcbab80ryxhrszvnj59wy0y0vm"))

(define rust-endian-type-0.1.2
  (crate-source "endian-type" "0.1.2"
                "0bbh88zaig1jfqrm7w3gx0pz81kw2jakk3055vbgapw3dmk08ky3"))

(define rust-endian-type-0.2.0
  (crate-source "endian-type" "0.2.0"
                "1wk235wxf0kqwlbjp3racbl55jwzmh52fg8cbjf1lr93vbdhm6w6"))

(define rust-enum-as-inner-0.6.1
  (crate-source "enum-as-inner" "0.6.1"
                "1g3cywc65d9w974l2xy86ij13njss3qjc7b0kfbzbws9qrjs5rm1"))

(define rust-equivalent-1.0.2
  (crate-source "equivalent" "1.0.2"
                "03swzqznragy8n0x31lqc78g2af054jwivp7lkrbrc0khz74lyl7"))

(define rust-errno-0.3.14
  (crate-source "errno" "0.3.14"
                "1szgccmh8vgryqyadg8xd58mnwwicf39zmin3bsn63df2wbbgjir"))

(define rust-event-listener-2.5.3
  (crate-source "event-listener" "2.5.3"
                "1q4w3pndc518crld6zsqvvpy9lkzwahp2zgza9kbzmmqh9gif1h2"))

(define rust-event-listener-5.4.1
  (crate-source "event-listener" "5.4.1"
                "1asnp3agbr8shcl001yd935m167ammyi8hnvl0q1ycajryn6cfz1"))

(define rust-event-listener-strategy-0.5.4
  (crate-source "event-listener-strategy" "0.5.4"
                "14rv18av8s7n8yixg38bxp5vg2qs394rl1w052by5npzmbgz7scb"))

(define rust-fallible-iterator-0.2.0
  (crate-source "fallible-iterator" "0.2.0"
                "1xq759lsr8gqss7hva42azn3whgrbrs2sd9xpn92c5ickxm1fhs4"))

(define rust-fallible-iterator-0.3.0
  (crate-source "fallible-iterator" "0.3.0"
                "0ja6l56yka5vn4y4pk6hn88z0bpny7a8k1919aqjzp0j1yhy9k1a"))

(define rust-fallible-streaming-iterator-0.1.9
  (crate-source "fallible-streaming-iterator" "0.1.9"
                "0nj6j26p71bjy8h42x6jahx1hn0ng6mc2miwpgwnp8vnwqf4jq3k"))

(define rust-fancy-regex-0.14.0
  (crate-source "fancy-regex" "0.14.0"
                "162j2qx2ikgl79grq12mawyflwkirnjzrvxh11a1xbmwjidcn93f"))

(define rust-farmhash-1.1.5
  (crate-source "farmhash" "1.1.5"
                "0jz3xvrrmsssjmshgw8anmly792i55sk1hyvx9fcg4cqzg4fjp7k"))

(define rust-fast-float-0.2.0
  (crate-source "fast-float" "0.2.0"
                "0g7kfll3xyh99kc7r352lhljnwvgayxxa6saifb6725inikmyxlm"))

(define rust-fastbloom-0.14.0
  (crate-source "fastbloom" "0.14.0"
                "0ali798hrpajrnanr2y6b0b2an8cpymczx5xsv15918x4fwxvh8q"))

(define rust-fastrand-1.9.0
  (crate-source "fastrand" "1.9.0"
                "1gh12m56265ihdbzh46bhh0jf74i197wm51jg1cw75q7ggi96475"))

(define rust-fastrand-2.3.0
  (crate-source "fastrand" "2.3.0"
                "1ghiahsw1jd68df895cy5h3gzwk30hndidn3b682zmshpgmrx41p"))

(define rust-ff-0.13.1
  (crate-source "ff" "0.13.1"
                "14v3bc6q24gbcjnxjfbq2dddgf4as2z2gd4mj35gjlrncpxhpdf0"))

(define rust-fiat-crypto-0.2.9
  (crate-source "fiat-crypto" "0.2.9"
                "07c1vknddv3ak7w89n85ik0g34nzzpms6yb845vrjnv9m4csbpi8"))

(define rust-find-msvc-tools-0.1.4
  (crate-source "find-msvc-tools" "0.1.4"
                "09x1sfinrz86bkm6i2d85lpsfnxn0w797g5zisv1nwhaz1w1h1aj"))

(define rust-fixedbitset-0.4.2
  (crate-source "fixedbitset" "0.4.2"
                "101v41amgv5n9h4hcghvrbfk5vrncx1jwm35rn5szv4rk55i7rqc"))

(define rust-fixedbitset-0.5.7
  (crate-source "fixedbitset" "0.5.7"
                "16fd3v9d2cms2vddf9xhlm56sz4j0zgrk3d2h6v1l7hx760lwrqx"))

(define rust-flate2-1.1.4
  (crate-source "flate2" "1.1.4"
                "1a8a3pk2r2dxays4ikc47ygydhpd1dcxlgqdi3r9kiiq9rb4wnnw"))

(define rust-flume-0.11.1
  (crate-source "flume" "0.11.1"
                "15ch0slxa8sqsi6c73a0ky6vdnh48q8cxjf7rksa3243m394s3ns"))

(define rust-fnv-1.0.7
  (crate-source "fnv" "1.0.7"
                "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))

(define rust-foldhash-0.1.5
  (crate-source "foldhash" "0.1.5"
                "1wisr1xlc2bj7hk4rgkcjkz3j2x4dhd1h9lwk7mj8p71qpdgbi6r"))

(define rust-foldhash-0.2.0
  (crate-source "foldhash" "0.2.0"
                "1nvgylb099s11xpfm1kn2wcsql080nqmnhj1l25bp3r2b35j9kkp"))

(define rust-foreign-types-0.3.2
  (crate-source "foreign-types" "0.3.2"
                "1cgk0vyd7r45cj769jym4a6s7vwshvd0z4bqrb92q1fwibmkkwzn"))

(define rust-foreign-types-shared-0.1.1
  (crate-source "foreign-types-shared" "0.1.1"
                "0jxgzd04ra4imjv8jgkmdq59kj8fsz6w4zxsbmlai34h26225c00"))

(define rust-form-data-0.6.0
  (crate-source "form-data" "0.6.0"
                "1kglqhmckp0nrq52jp848fd8585ysdy7d3h1d98x7x30799dhmrp"))

(define rust-form-urlencoded-1.2.2
  (crate-source "form_urlencoded" "1.2.2"
                "1kqzb2qn608rxl3dws04zahcklpplkd5r1vpabwga5l50d2v4k6b"))

(define rust-foundationdb-0.9.2
  (crate-source "foundationdb" "0.9.2"
                "1kyc13806hq2vy2n5z6k0p3hc830qb0kqya6lxj2zkxv2bzfyjji"))

(define rust-foundationdb-gen-0.9.2
  (crate-source "foundationdb-gen" "0.9.2"
                "0n73r8dydl4qcap2jw3hr8xwzy4bzawy4scp17sf2cyzcr48b7gg"))

(define rust-foundationdb-macros-0.3.2
  (crate-source "foundationdb-macros" "0.3.2"
                "0zvg3dxrnkg2l32p9b7qvkdvg4kplncv05gvancdi4js5r0i1rlv"))

(define rust-foundationdb-sys-0.9.1
  ;; TODO: Check bundled sources.
  (crate-source "foundationdb-sys" "0.9.1"
                "0r392wgd407gjhmqzbgh9rsbk7dw32xrw6590m4wr38blgdi9biv"))

(define rust-foundationdb-tuple-0.9.1
  (crate-source "foundationdb-tuple" "0.9.1"
                "1ymhq9a796ffzsc18kcpz1bpg93rh6sc7xwki1qxx4p5zg0k465g"))

(define rust-funty-2.0.0
  (crate-source "funty" "2.0.0"
                "177w048bm0046qlzvp33ag3ghqkqw4ncpzcm5lq36gxf2lla7mg6"))

(define rust-futures-0.3.31
  (crate-source "futures" "0.3.31"
                "0xh8ddbkm9jy8kc5gbvjp9a4b6rqqxvc8471yb2qaz5wm2qhgg35"))

(define rust-futures-channel-0.3.31
  (crate-source "futures-channel" "0.3.31"
                "040vpqpqlbk099razq8lyn74m0f161zd0rp36hciqrwcg2zibzrd"))

(define rust-futures-core-0.3.31
  (crate-source "futures-core" "0.3.31"
                "0gk6yrxgi5ihfanm2y431jadrll00n5ifhnpx090c2f2q1cr1wh5"))

(define rust-futures-executor-0.3.31
  (crate-source "futures-executor" "0.3.31"
                "17vcci6mdfzx4gbk0wx64chr2f13wwwpvyf3xd5fb1gmjzcx2a0y"))

(define rust-futures-io-0.3.31
  (crate-source "futures-io" "0.3.31"
                "1ikmw1yfbgvsychmsihdkwa8a1knank2d9a8dk01mbjar9w1np4y"))

(define rust-futures-lite-1.13.0
  (crate-source "futures-lite" "1.13.0"
                "1kkbqhaib68nzmys2dc8j9fl2bwzf2s91jfk13lb2q3nwhfdbaa9"))

(define rust-futures-macro-0.3.31
  (crate-source "futures-macro" "0.3.31"
                "0l1n7kqzwwmgiznn0ywdc5i24z72zvh9q1dwps54mimppi7f6bhn"))

(define rust-futures-sink-0.3.31
  (crate-source "futures-sink" "0.3.31"
                "1xyly6naq6aqm52d5rh236snm08kw8zadydwqz8bip70s6vzlxg5"))

(define rust-futures-task-0.3.31
  (crate-source "futures-task" "0.3.31"
                "124rv4n90f5xwfsm9qw6y99755y021cmi5dhzh253s920z77s3zr"))

(define rust-futures-util-0.3.31
  (crate-source "futures-util" "0.3.31"
                "10aa1ar8bgkgbr4wzxlidkqkcxf77gffyj8j7768h831pcaq784z"))

(define rust-generic-array-0.14.9
  (crate-source "generic-array" "0.14.9"
                "1wpdn5ngpqkkyyibbg7wa4cfg0y8zjc57spaia2h47jkk0qp9djb"))

(define rust-generic-array-1.3.4
  (crate-source "generic-array" "1.3.4"
                "0q06wk7w6hw25mlj9g593cpjfyfbwwkznxsa90fka0nvxdw5anlq"))

(define rust-gethostname-1.1.0
  (crate-source "gethostname" "1.1.0"
                "1n6bj9gh503ggjblfjcai96gmxynxsrykaynljlrfdra34q95m0v"))

(define rust-getrandom-0.1.16
  (crate-source "getrandom" "0.1.16"
                "1kjzmz60qx9mn615ks1akjbf36n3lkv27zfwbcam0fzmj56wphwg"))

(define rust-getrandom-0.2.16
  (crate-source "getrandom" "0.2.16"
                "14l5aaia20cc6cc08xdlhrzmfcylmrnprwnna20lqf746pqzjprk"))

(define rust-getrandom-0.3.4
  (crate-source "getrandom" "0.3.4"
                "1zbpvpicry9lrbjmkd4msgj3ihff1q92i334chk7pzf46xffz7c9"))

(define rust-ghash-0.5.1
  (crate-source "ghash" "0.5.1"
                "1wbg4vdgzwhkpkclz1g6bs4r5x984w5gnlsj4q5wnafb5hva9n7h"))

(define rust-gimli-0.32.3
  (crate-source "gimli" "0.32.3"
                "1iqk5xznimn5bfa8jy4h7pa1dv3c624hzgd2dkz8mpgkiswvjag6"))

(define rust-git-version-0.3.9
  (crate-source "git-version" "0.3.9"
                "06ddi3px6l2ip0srn8512bsh8wrx4rzi65piya0vrz5h7nm6im8s"))

(define rust-git-version-macro-0.3.9
  (crate-source "git-version-macro" "0.3.9"
                "1h1s08fgh9bkwnc2hmjxcldv69hlxpq7a09cqdxsd5hb235hq0ak"))

(define rust-glob-0.3.3
  (crate-source "glob" "0.3.3"
                "106jpd3syfzjfj2k70mwm0v436qbx96wig98m4q8x071yrq35hhc"))

(define rust-group-0.13.0
  (crate-source "group" "0.13.0"
                "0qqs2p5vqnv3zvq9mfjkmw3qlvgqb0c3cm6p33srkh7pc9sfzygh"))

(define rust-h2-0.3.27
  (crate-source "h2" "0.3.27"
                "0b92141hilij015av6i5ziw9xfx4py3lbjy17yc35z5ih01sbv0b"))

(define rust-h2-0.4.12
  (crate-source "h2" "0.4.12"
                "11hk5mpid8757z6n3v18jwb62ikffrgzjlrgpzqvkqdlzjfbdh7k"))

(define rust-hashbrown-0.12.3
  (crate-source "hashbrown" "0.12.3"
                "1268ka4750pyg2pbgsr43f0289l5zah4arir2k4igx5a8c6fg7la"))

(define rust-hashbrown-0.14.5
  (crate-source "hashbrown" "0.14.5"
                "1wa1vy1xs3mp11bn3z9dv0jricgr6a2j0zkf1g19yz3vw4il89z5"))

(define rust-hashbrown-0.15.5
  (crate-source "hashbrown" "0.15.5"
                "189qaczmjxnikm9db748xyhiw04kpmhm9xj9k9hg0sgx7pjwyacj"))

(define rust-hashbrown-0.16.0
  (crate-source "hashbrown" "0.16.0"
                "13blh9j2yv77a6ni236ixiwdzbc1sh2bc4bdpaz7y859yv2bs6al"))

(define rust-hashify-0.2.7
  (crate-source "hashify" "0.2.7"
                "0k2x1vrkafnhhwk5y8yh6a835f81fizwpqygak9nm8mm1slkx7hl"))

(define rust-hashlink-0.10.0
  (crate-source "hashlink" "0.10.0"
                "1h8lzvnl9qxi3zyagivzz2p1hp6shgddfmccyf6jv7s1cdicz0kk"))

(define rust-heck-0.4.1
  (crate-source "heck" "0.4.1"
                "1a7mqsnycv5z4z5vnv1k34548jzmc0ajic7c1j8jsaspnhw5ql4m"))

(define rust-heck-0.5.0
  (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-hermit-abi-0.5.2
  (crate-source "hermit-abi" "0.5.2"
                "1744vaqkczpwncfy960j2hxrbjl1q01csm84jpd9dajbdr2yy3zw"))

(define rust-hex-0.4.3
  (crate-source "hex" "0.4.3"
                "0w1a4davm1lgzpamwnba907aysmlrnygbqmfis2mqjx5m552a93z"))

(define rust-hickory-client-0.24.4
  (crate-source "hickory-client" "0.24.4"
                "1pm6ypps966d994bm8b3l5wbj3c7xsv23k47vzqcc7wdrnjpjr8m"))

(define rust-hickory-proto-0.24.4
  (crate-source "hickory-proto" "0.24.4"
                "0j3j26brvg83a4xvdlvxxgkycdmaklbd2f6cag76cvyfr5kj0rcj"))

(define rust-hickory-proto-0.26.0-alpha.1
  (crate-source "hickory-proto" "0.26.0-alpha.1"
                "1cb1xc1f7k3l95mm57d0mqwh0rdnz4iw125y8iizkc36yy27cbd6"))

(define rust-hickory-resolver-0.26.0-alpha.1
  (crate-source "hickory-resolver" "0.26.0-alpha.1"
                "1x33yw0s3i6kn86jfinc9xi9014dhpqx3yx1bca428zqlwk5xaxv"))

(define rust-hkdf-0.12.4
  (crate-source "hkdf" "0.12.4"
                "1xxxzcarz151p1b858yn5skmhyrvn8fs4ivx5km3i1kjmnr8wpvv"))

(define rust-hmac-0.10.1
  (crate-source "hmac" "0.10.1"
                "058yxq54x7xn0gk2vy9bl51r32c9z7qlcl2b80bjh3lk3rmiqi61"))

(define rust-hmac-0.12.1
  (crate-source "hmac" "0.12.1"
                "0pmbr069sfg76z7wsssfk5ddcqd9ncp79fyz6zcm6yn115yc6jbc"))

(define rust-home-0.5.11
  (crate-source "home" "0.5.11"
                "1kxb4k87a9sayr8jipr7nq9wpgmjk4hk4047hmf9kc24692k75aq"))

(define rust-hostname-0.4.1
  (crate-source "hostname" "0.4.1"
                "0rbxryl68bwv8hkjdjd8f37kdb10fncgsqrqksv64qy7s4y20vx5"))

(define rust-http-0.2.12
  (crate-source "http" "0.2.12"
                "1w81s4bcbmcj9bjp7mllm8jlz6b31wzvirz8bgpzbqkpwmbvn730"))

(define rust-http-1.3.1
  (crate-source "http" "1.3.1"
                "0r95i5h7dr1xadp1ac9453w0s62s27hzkam356nyx2d9mqqmva7l"))

(define rust-http-body-0.4.6
  (crate-source "http-body" "0.4.6"
                "1lmyjfk6bqk6k9gkn1dxq770sb78pqbqshga241hr5p995bb5skw"))

(define rust-http-body-1.0.1
  (crate-source "http-body" "1.0.1"
                "111ir5k2b9ihz5nr9cz7cwm7fnydca7dx4hc7vr16scfzghxrzhy"))

(define rust-http-body-util-0.1.3
  (crate-source "http-body-util" "0.1.3"
                "0jm6jv4gxsnlsi1kzdyffjrj8cfr3zninnxpw73mvkxy4qzdj8dh"))

(define rust-http-types-2.12.0
  (crate-source "http-types" "2.12.0"
                "1bgmfmvirsa1alcyw15mkh227j3a62aq1x47lkxxnfnnf9x1i6vf"))

(define rust-httparse-1.10.1
  (crate-source "httparse" "1.10.1"
                "11ycd554bw2dkgw0q61xsa7a4jn1wb1xbfacmf3dbwsikvkkvgvd"))

(define rust-httpdate-1.0.3
  (crate-source "httpdate" "1.0.3"
                "1aa9rd2sac0zhjqh24c9xvir96g188zldkx0hr6dnnlx5904cfyz"))

(define rust-human-size-0.4.3
  (crate-source "human-size" "0.4.3"
                "1sza13s9vrhgqnci78wn58g8601bpcipibk3dhbb6f8sijgbg54r"))

(define rust-humantime-2.3.0
  (crate-source "humantime" "2.3.0"
                "092lpipp32ayz4kyyn4k3vz59j9blng36wprm5by0g2ykqr14nqk"))

(define rust-hyper-0.14.32
  (crate-source "hyper" "0.14.32"
                "1rvcb0smz8q1i0y6p7rwxr02x5sclfg2hhxf3g0774zczn0cgps1"))

(define rust-hyper-1.7.0
  (crate-source "hyper" "1.7.0"
                "07n59pxzlq621z611cbpvh7p4h9h15v0r7m5wgxygpx02d5aafpb"))

(define rust-hyper-rustls-0.24.2
  (crate-source "hyper-rustls" "0.24.2"
                "1475j4a2nczz4aajzzsq3hpwg1zacmzbqg393a14j80ff8izsgpc"))

(define rust-hyper-rustls-0.27.7
  (crate-source "hyper-rustls" "0.27.7"
                "0n6g8998szbzhnvcs1b7ibn745grxiqmlpg53xz206v826v3xjg3"))

(define rust-hyper-timeout-0.5.2
  (crate-source "hyper-timeout" "0.5.2"
                "1c431l5ckr698248yd6bnsmizjy2m1da02cbpmsnmkpvpxkdb41b"))

(define rust-hyper-util-0.1.17
  (crate-source "hyper-util" "0.1.17"
                "1a5fcnz0alrg4lx9xf6ja66ihaab58jnm5msnky804wg39cras9w"))

(define rust-iana-time-zone-0.1.64
  (crate-source "iana-time-zone" "0.1.64"
                "1yz980fmhaq9bdkasz35z63az37ci6kzzfhya83kgdqba61pzr9k"))

(define rust-iana-time-zone-haiku-0.1.2
  (crate-source "iana-time-zone-haiku" "0.1.2"
                "17r6jmj31chn7xs9698r122mapq85mfnv98bb4pg6spm0si2f67k"))

(define rust-icu-collections-2.0.0
  (crate-source "icu_collections" "2.0.0"
                "0izfgypv1hsxlz1h8fc2aak641iyvkak16aaz5b4aqg3s3sp4010"))

(define rust-icu-locale-core-2.0.0
  (crate-source "icu_locale_core" "2.0.0"
                "02phv7vwhyx6vmaqgwkh2p4kc2kciykv2px6g4h8glxfrh02gphc"))

(define rust-icu-normalizer-2.0.0
  (crate-source "icu_normalizer" "2.0.0"
                "0ybrnfnxx4sf09gsrxri8p48qifn54il6n3dq2xxgx4dw7l80s23"))

(define rust-icu-normalizer-data-2.0.0
  (crate-source "icu_normalizer_data" "2.0.0"
                "1lvjpzxndyhhjyzd1f6vi961gvzhj244nribfpdqxjdgjdl0s880"))

(define rust-icu-properties-2.0.1
  (crate-source "icu_properties" "2.0.1"
                "0az349pjg8f18lrjbdmxcpg676a7iz2ibc09d2wfz57b3sf62v01"))

(define rust-icu-properties-data-2.0.1
  (crate-source "icu_properties_data" "2.0.1"
                "0cnn3fkq6k88w7p86w7hsd1254s4sl783rpz4p6hlccq74a5k119"))

(define rust-icu-provider-2.0.0
  (crate-source "icu_provider" "2.0.0"
                "1bz5v02gxv1i06yhdhs2kbwxkw3ny9r2vvj9j288fhazgfi0vj03"))

(define rust-idea-0.5.1
  (crate-source "idea" "0.5.1"
                "0xv4hd9mgrwgzfl7cc5nlwyahm9yni5z9dwb3c1z5mqr8h05fm87"))

(define rust-ident-case-1.0.1
  (crate-source "ident_case" "1.0.1"
                "0fac21q6pwns8gh1hz3nbq15j8fi441ncl6w4vlnd1cmc55kiq5r"))

(define rust-idna-1.1.0
  (crate-source "idna" "1.1.0"
                "1pp4n7hppm480zcx411dsv9wfibai00wbpgnjj4qj0xa7kr7a21v"))

(define rust-idna-adapter-1.2.1
  (crate-source "idna_adapter" "1.2.1"
                "0i0339pxig6mv786nkqcxnwqa87v4m94b2653f6k3aj0jmhfkjis"))

(define rust-imagesize-0.14.0
  (crate-source "imagesize" "0.14.0"
                "1725g398w4v35qrv9s3gl8gl5cqj5cwkamn7mvvl12y4niblxr89"))

(define rust-include-flate-0.3.1
  (crate-source "include-flate" "0.3.1"
                "167r4qx7yfs4vphrpgh98ixkmd94jy63a76sghg64ak8rav7q6z0"))

(define rust-include-flate-codegen-0.3.1
  (crate-source "include-flate-codegen" "0.3.1"
                "0l40qk0p1pi020v3y5ywh6jfzwgafyli9fkfds6ldgmffi9byjag"))

(define rust-include-flate-compress-0.3.1
  (crate-source "include-flate-compress" "0.3.1"
                "1g2dhaizqw9ixpyi751fgrj4yaji47crrdyvylqmkkbbf47a9rpa"))

(define rust-indexmap-1.9.3
  (crate-source "indexmap" "1.9.3"
                "16dxmy7yvk51wvnih3a3im6fp5lmx0wx76i03n06wyak6cwhw1xx"))

(define rust-indexmap-2.12.0
  (crate-source "indexmap" "2.12.0"
                "17xs7cqf9nzv8iw8yzpvpjh43lcf9492i8a3xfia2ad9lp9ah5v7"))

(define rust-indicatif-0.17.11
  (crate-source "indicatif" "0.17.11"
                "0db2b2r79r9x8x4lysq1ci9xm13c0xg0sqn3z960yh2bk2430fqq"))

(define rust-infer-0.19.0
  (crate-source "infer" "0.19.0"
                "1xzwzzg7s3i9jhcd304rb7b7838zkcysd67gmhffg4pxzmmr3255"))

(define rust-infer-0.2.3
  (crate-source "infer" "0.2.3"
                "1b4ziqcv0d1wga5yfqf620dkgzijsdw3ylnzq61bfaxla2d85sb4"))

(define rust-inout-0.1.4
  (crate-source "inout" "0.1.4"
                "008xfl1jn9rxsq19phnhbimccf4p64880jmnpg59wqi07kk117w7"))

(define rust-instant-0.1.13
  (crate-source "instant" "0.1.13"
                "08h27kzvb5jw74mh0ajv0nv9ggwvgqm8ynjsn2sa9jsks4cjh970"))

(define rust-ipconfig-0.3.2
  (crate-source "ipconfig" "0.3.2"
                "0zwr0x3jnqmjdqqbzhb0nid011qyhcyfdfqv32cdw85pjqpvk3dm"))

(define rust-ipnet-2.11.0
  (crate-source "ipnet" "2.11.0"
                "0c5i9sfi2asai28m8xp48k5gvwkqrg5ffpi767py6mzsrswv17s6"))

(define rust-ipnetwork-0.20.0
  (crate-source "ipnetwork" "0.20.0"
                "03hhmxyimz0800z44wl3z1ak8iw91xcnk7sgx5p5jinmx50naimz"))

(define rust-iri-string-0.7.8
  (crate-source "iri-string" "0.7.8"
                "1cl0wfq97wq4s1p4dl0ix5cfgsc5fn7l22ljgw9ab9x1qglypifv"))

(define rust-is-terminal-0.4.16
  (crate-source "is-terminal" "0.4.16"
                "1acm63whnpwiw1padm9bpqz04sz8msymrmyxc55mvlq8hqqpykg0"))

(define rust-is-terminal-polyfill-1.70.1
  (crate-source "is_terminal_polyfill" "1.70.1"
                "1kwfgglh91z33kl0w5i338mfpa3zs0hidq5j4ny4rmjwrikchhvr"))

(define rust-itertools-0.10.5
  (crate-source "itertools" "0.10.5"
                "0ww45h7nxx5kj6z2y6chlskxd1igvs4j507anr6dzg99x1h25zdh"))

(define rust-itertools-0.11.0
  (crate-source "itertools" "0.11.0"
                "0mzyqcc59azx9g5cg6fs8k529gvh4463smmka6jvzs3cd2jp7hdi"))

(define rust-itertools-0.13.0
  (crate-source "itertools" "0.13.0"
                "11hiy3qzl643zcigknclh446qb9zlg4dpdzfkjaa9q9fqpgyfgj1"))

(define rust-itertools-0.14.0
  (crate-source "itertools" "0.14.0"
                "118j6l1vs2mx65dqhwyssbrxpawa90886m3mzafdvyip41w2q69b"))

(define rust-itoa-1.0.15
  (crate-source "itoa" "1.0.15"
                "0b4fj9kz54dr3wam0vprjwgygvycyw8r0qwg7vp19ly8b2w16psa"))

(define rust-jemalloc-sys-0.5.4+5.3.0-patched
  ;; TODO: Check bundled sources.
  (crate-source "jemalloc-sys" "0.5.4+5.3.0-patched"
                "1wpbpwhfs6wd484cdfpl0zdf441ann9wj0fypy67i8ffw531jv5c"))

(define rust-jemallocator-0.5.4
  (crate-source "jemallocator" "0.5.4"
                "1g6k9ly6wxj53bp8lz9lg9nj4s662k6612jydw71aqwfkx53gpm0"))

(define rust-jieba-macros-0.8.1
  (crate-source "jieba-macros" "0.8.1"
                "0p59dlhh52aq46b02i15cdcp7g7yz2868rfshlkc9qz79vj990il"))

(define rust-jieba-rs-0.8.1
  (crate-source "jieba-rs" "0.8.1"
                "01bi9fsvjnzcipaqbq0q54nii6ymvlxykx5x3r0lkfm5580xfsvn"))

(define rust-jmap-client-0.3.3
  (crate-source "jmap-client" "0.3.3"
                "1vmibsw87giqkxfgzlc0s6b6mb063ydw1v2yx8bh0gl7acvym7f9"))

(define rust-jmap-client-0.4.0
  (crate-source "jmap-client" "0.4.0"
                "0fija4jkvn41v2fjyix8mzanimf8617jy55zc4nc3iwbcv26k8mh"))

(define rust-jmap-tools-0.1.3
  (crate-source "jmap-tools" "0.1.3"
                "04rh974ymaqd600rm11016rryh9apkr7pz54vx9pqb1v3lpnpsmn"))

(define rust-jni-0.21.1
  (crate-source "jni" "0.21.1"
                "15wczfkr2r45slsljby12ymf2hij8wi5b104ghck9byjnwmsm1qs"))

(define rust-jni-sys-0.3.0
  ;; TODO: Check bundled sources.
  (crate-source "jni-sys" "0.3.0"
                "0c01zb9ygvwg9wdx2fii2d39myzprnpqqhy7yizxvjqp5p04pbwf"))

(define rust-jobserver-0.1.34
  (crate-source "jobserver" "0.1.34"
                "0cwx0fllqzdycqn4d6nb277qx5qwnmjdxdl0lxkkwssx77j3vyws"))

(define rust-js-sys-0.3.81
  ;; TODO: Check bundled sources.
  (crate-source "js-sys" "0.3.81"
                "01ckbf16iwh7qj92fax9zh8vf2y9sk60cli6999cn7a1jxx96j7c"))

(define rust-json5-0.4.1
  (crate-source "json5" "0.4.1"
                "1h9hni897zmn3vcixfbwwkj2gkz27h7z9dah8bk1qv37mwhxpc4n"))

(define rust-keccak-0.1.5
  (crate-source "keccak" "0.1.5"
                "0m06swsyd58hvb1z17q6picdwywprf1yf1s6l491zi8r26dazhpc"))

(define rust-keyed-priority-queue-0.4.2
  (crate-source "keyed_priority_queue" "0.4.2"
                "03b452v0b56xa8msf1hvn087qcmayipz4wq1kmgswi1fmcyqkrsf"))

(define rust-keyed-set-1.1.0
  (crate-source "keyed-set" "1.1.0"
                "1brby8r9f9m1a54fn07m0dszz6q3sy2fj7g97jwppmzcnsk5bll9"))

(define rust-konst-0.3.16
  (crate-source "konst" "0.3.16"
                "1scld0y903rzpnrpq6pgin19czhigkpkliz9xgr53wjm1jqbk0a3"))

(define rust-konst-kernel-0.3.15
  (crate-source "konst_kernel" "0.3.15"
                "0g6c7l852g89f28gbgwf6n68jvhd0slsf5hikdi4r0pki1vypcg4"))

(define rust-lalrpop-0.20.2
  (crate-source "lalrpop" "0.20.2"
                "1jn1qg7gs9kka6sy2sbxx8wp6z8lm892ksr414b9yaansrx0gjsm"))

(define rust-lalrpop-util-0.20.2
  (crate-source "lalrpop-util" "0.20.2"
                "0lr5r12bh9gjjlmnjrbblf4bfcwnad4gz1hqjvp34yzb22ln0x2h"))

(define rust-lazy-static-1.5.0
  (crate-source "lazy_static" "1.5.0"
                "1zk6dqqni0193xg6iijh7i3i44sryglwgvx20spdvwk3r6sbrlmv"))

(define rust-lber-0.5.1
  (crate-source "lber" "0.5.1"
                "198956hgqyf3lbbcvcmqm51mlcv6jyashac3926zxndz4jb5bkyb"))

(define rust-ldap3-0.12.1
  (crate-source "ldap3" "0.12.1"
                "00vmbhgdiscfv1ah757fk9m053im02gzyf1s3rqf9dygwzsqkzh1"))

(define rust-libbz2-rs-sys-0.2.2
  ;; TODO: Check bundled sources.
  (crate-source "libbz2-rs-sys" "0.2.2"
                "1xz88pa6xc372kjnr9gv4qaz5myjna9d7db5a2a7sk142md58jic"))

(define rust-libc-0.2.177
  (crate-source "libc" "0.2.177"
                "0xjrn69cywaii1iq2lib201bhlvan7czmrm604h5qcm28yps4x18"))

(define rust-libflate-2.1.0
  (crate-source "libflate" "2.1.0"
                "07mj9z89vbhq837q58m4v2nblgsmrn6vrp8w1j8g0kpa2kfdzna5"))

(define rust-libflate-lz77-2.1.0
  (crate-source "libflate_lz77" "2.1.0"
                "0gc6h98jwigscasz8vw1vv65b3rismqcbndb8hf6yf4z6qxxgq76"))

(define rust-libloading-0.8.9
  (crate-source "libloading" "0.8.9"
                "0mfwxwjwi2cf0plxcd685yxzavlslz7xirss3b9cbrzyk4hv1i6p"))

(define rust-libm-0.2.15
  (crate-source "libm" "0.2.15"
                "1plpzf0p829viazdj57yw5dhmlr8ywf3apayxc2f2bq5a6mvryzr"))

(define rust-libredox-0.1.10
  (crate-source "libredox" "0.1.10"
                "1jswil4ai90s4rh91fg8580x8nikni1zl3wnch4h01nvidqpwvs1"))

(define rust-librocksdb-sys-0.17.3+10.4.2
  ;; TODO: Check bundled sources.
  (crate-source "librocksdb-sys" "0.17.3+10.4.2"
                "1saxhd31fz405axllvxbw8fawgwl4fmys8whghajdr8gwq7a1wnf"))

(define rust-libsqlite3-sys-0.35.0
  ;; TODO: Check bundled sources.
  (crate-source "libsqlite3-sys" "0.35.0"
                "0gy1m6j1l94fxsirzp4h4rkrksf78rz7jy3px57qd1rcd8m1hg0k"))

(define rust-libz-rs-sys-0.5.2
  ;; TODO: Check bundled sources.
  (crate-source "libz-rs-sys" "0.5.2"
                "1kdy093bhxfkgx7li3raxigcc3qdqjn3hvrpjkblvv6r777vh3c4"))

(define rust-libz-sys-1.1.22
  ;; TODO: Check bundled sources.
  (crate-source "libz-sys" "1.1.22"
                "07b5wxh0ska996kc0g2hanjhmb4di7ksm6ndljhr4pi0vykyfw4b"))

(define rust-linked-hash-map-0.5.6
  (crate-source "linked-hash-map" "0.5.6"
                "03vpgw7x507g524nx5i1jf5dl8k3kv0fzg8v3ip6qqwbpkqww5q7"))

(define rust-linux-raw-sys-0.11.0
  ;; TODO: Check bundled sources.
  (crate-source "linux-raw-sys" "0.11.0"
                "0fghx0nn8nvbz5yzgizfcwd6ap2pislp68j8c1bwyr6sacxkq7fz"))

(define rust-litemap-0.8.0
  (crate-source "litemap" "0.8.0"
                "0mlrlskwwhirxk3wsz9psh6nxcy491n0dh8zl02qgj0jzpssw7i4"))

(define rust-lock-api-0.4.14
  (crate-source "lock_api" "0.4.14"
                "0rg9mhx7vdpajfxvdjmgmlyrn20ligzqvn8ifmaz7dc79gkrjhr2"))

(define rust-log-0.4.28
  (crate-source "log" "0.4.28"
                "0cklpzrpxafbaq1nyxarhnmcw9z3xcjrad3ch55mmr58xw2ha21l"))

(define rust-lru-0.14.0
  (crate-source "lru" "0.14.0"
                "160ivb75982rdarpals1d9cxcfjlixl7kwx6k7ghpwamc48cg34z"))

(define rust-lru-cache-0.1.2
  (crate-source "lru-cache" "0.1.2"
                "071viv6g2p3akwqmfb3c8vsycs5n7kr17b70l7la071jv0d4zqii"))

(define rust-lru-slab-0.1.2
  (crate-source "lru-slab" "0.1.2"
                "0m2139k466qj3bnpk66bwivgcx3z88qkxvlzk70vd65jq373jaqi"))

(define rust-lz4-flex-0.11.5
  (crate-source "lz4_flex" "0.11.5"
                "0nipxnlw1jwsk7nv4gbq519drjcingm406adhh7akv7fwdkjiaq8"))

(define rust-lz4-sys-1.11.1+lz4-1.10.0
  ;; TODO: Check bundled sources.
  (crate-source "lz4-sys" "1.11.1+lz4-1.10.0"
                "1rhqnhwq05fmlc2q39ipsq0vpi0xf6w6p22j6q5x637dqvbc1n3b"))

(define rust-lzma-rust2-0.13.0
  (crate-source "lzma-rust2" "0.13.0"
                "0jlaq6b1c1vrv1nlg16bf7qggqj68yqlc4ig34ipwlhdp7zj62n6"))

(define rust-mail-auth-0.7.2
  (crate-source "mail-auth" "0.7.2"
                "1dwbbbnlx2rwakvrlwpamhi0ssxicysgr5wpf29pj07pw1mr5kwl"))

(define rust-mail-builder-0.4.4
  (crate-source "mail-builder" "0.4.4"
                "0fs7214f92cav734hi0n9cr6fh3q1dv4vccal89l131k0zrrh2ch"))

(define rust-mail-parser-0.11.1
  (crate-source "mail-parser" "0.11.1"
                "18qra6c5fcvjif1r3pjj553bnpc1h2sxzk6y1crzmrn4843kkx6w"))

(define rust-mail-send-0.5.2
  (crate-source "mail-send" "0.5.2"
                "07ik312zybp141g7bizd3cxq2342kcaa93ryg0c8kbygycklwjhi"))

(define rust-maplit-1.0.2
  (crate-source "maplit" "1.0.2"
                "07b5kjnhrrmfhgqm9wprjw8adx6i225lqp49gasgqg74lahnabiy"))

(define rust-matchers-0.2.0
  (crate-source "matchers" "0.2.0"
                "1sasssspdj2vwcwmbq3ra18d3qniapkimfcbr47zmx6750m5llni"))

(define rust-maybe-async-0.2.10
  (crate-source "maybe-async" "0.2.10"
                "04fvg2ywb2p9dzf7i35xqfibxc05k1pirv36jswxcqg3qw82ryaw"))

(define rust-md-5-0.10.6
  (crate-source "md-5" "0.10.6"
                "1kvq5rnpm4fzwmyv5nmnxygdhhb2369888a06gdc9pxyrzh7x7nq"))

(define rust-md-5-0.9.1
  (crate-source "md-5" "0.9.1"
                "059ajjacz1q3cms7vl6cvhdqs4qdw2nnwj9dq99ryzv0p6djfnkv"))

(define rust-md5-0.7.0
  (crate-source "md5" "0.7.0"
                "0wcps37hrhz59fkhf8di1ppdnqld6l1w5sdy7jp7p51z0i4c8329"))

(define rust-md5-0.8.0
  (crate-source "md5" "0.8.0"
                "1q6jfsa5w3993dzymxkv9jxpp7vyhgga6z35g6c0c8rk50w0i5mf"))

(define rust-memchr-2.7.6
  (crate-source "memchr" "2.7.6"
                "0wy29kf6pb4fbhfksjbs05jy2f32r2f3r1ga6qkmpz31k79h0azm"))

(define rust-memory-stats-1.2.0
  (crate-source "memory-stats" "1.2.0"
                "0jjpxfmva3v6s28pmybp0i8984havzj3a2r2l3hib8cmk5j5qgy7"))

(define rust-memsec-0.7.0
  (crate-source "memsec" "0.7.0"
                "14ml8sva5apz4vg5pxlsfmf4y8a9prqzhrcw6vyb5ai3pgbbk5y7"))

(define rust-mime-0.3.17
  (crate-source "mime" "0.3.17"
                "16hkibgvb9klh0w0jk5crr5xv90l3wlf77ggymzjmvl1818vnxv8"))

(define rust-mime-guess-2.0.5
  (crate-source "mime_guess" "2.0.5"
                "03jmg3yx6j39mg0kayf7w4a886dl3j15y8zs119zw01ccy74zi7p"))

(define rust-minimal-lexical-0.2.1
  (crate-source "minimal-lexical" "0.2.1"
                "16ppc5g84aijpri4jzv14rvcnslvlpphbszc7zzp6vfkddf4qdb8"))

(define rust-miniz-oxide-0.8.9
  (crate-source "miniz_oxide" "0.8.9"
                "05k3pdg8bjjzayq3rf0qhpirq9k37pxnasfn4arbs17phqn6m9qz"))

(define rust-mio-1.1.0
  (crate-source "mio" "1.1.0"
                "0wr816q3jrjwiajvw807lgi540i9s6r78a5fx4ycz3nwhq03pn39"))

(define rust-moka-0.12.11
  (crate-source "moka" "0.12.11"
                "0xxhhs7lsfk47q065vibvggjhrf6h0lsvfji3m601q0jqf4csqc2"))

(define rust-munge-0.4.7
  (crate-source "munge" "0.4.7"
                "032sj47l2174dirkjkhi18x92wlgdqdld4b4l5n9bfly4lgl05sy"))

(define rust-munge-macro-0.4.7
  (crate-source "munge_macro" "0.4.7"
                "0cgrm4q8a6qm0802d08pacbv2mpcq4c47hrxc3avannlrdfg4s25"))

(define rust-mysql-async-0.36.1
  (crate-source "mysql_async" "0.36.1"
                "1siild75z1720czm6z7m6848100z7297h2qadp6g8alv8prf4z17"))

(define rust-mysql-common-0.35.5
  (crate-source "mysql_common" "0.35.5"
                "0lp072rqk1k4qzwk4a5ns9b6k4z86vfbq7y6jpq27rwcc5qz7fgv"))

(define rust-mysql-common-derive-0.32.1
  (crate-source "mysql-common-derive" "0.32.1"
                "1yhv5hf2124p7jl38hwiha7dpj399w67y0v4ixpwpa93fsnjrxk6"))

(define rust-nanorand-0.7.0
  (crate-source "nanorand" "0.7.0"
                "1hr60b8zlfy7mxjcwx2wfmhpkx7vfr3v9x12shmv1c10b0y32lba"))

(define rust-new-debug-unreachable-1.0.6
  (crate-source "new_debug_unreachable" "1.0.6"
                "11phpf1mjxq6khk91yzcbd3ympm78m3ivl7xg6lg2c0lf66fy3k5"))

(define rust-nibble-vec-0.1.0
  (crate-source "nibble_vec" "0.1.0"
                "0hsdp3s724s30hkqz74ky6sqnadhp2xwcj1n1hzy4vzkz4yxi9bp"))

(define rust-nix-0.30.1
  (crate-source "nix" "0.30.1"
                "1dixahq9hk191g0c2ydc0h1ppxj0xw536y6rl63vlnp06lx3ylkl"))

(define rust-nkeys-0.4.5
  (crate-source "nkeys" "0.4.5"
                "1gyi8g3nzcr4cizirb0cr92ldwwlzqyawdd9ypywg8a7pjx13447"))

(define rust-no-std-net-0.6.0
  (crate-source "no-std-net" "0.6.0"
                "0ravflgyh0q2142gjdz9iav5yqci3ga7gbnk4mmfcnqkrq54lya3"))

(define rust-nohash-0.2.0
  (crate-source "nohash" "0.2.0"
                "1ji8ylndxnq02pjwxfbac0yfs7xmcibpfd9c8j1xzb7pcvxqky50"))

(define rust-nom-7.1.3
  (crate-source "nom" "7.1.3"
                "0jha9901wxam390jcf5pfa0qqfrgh8li787jx2ip0yk5b8y9hwyj"))

(define rust-nonempty-collections-0.3.1
  (crate-source "nonempty-collections" "0.3.1"
                "17cbpp5qnm2qcwxvmbi57hdiqvf9blfnw3vqwmkglm4xrzld05p2"))

(define rust-nu-ansi-term-0.50.3
  (crate-source "nu-ansi-term" "0.50.3"
                "1ra088d885lbd21q1bxgpqdlk1zlndblmarn948jz2a40xsbjmvr"))

(define rust-nuid-0.5.0
  (crate-source "nuid" "0.5.0"
                "10vy5gjpjnvsmbavjlczhgfby9ldlwk0r8ha78b2kyanb3wmm2gw"))

(define rust-num-bigint-0.4.6
  (crate-source "num-bigint" "0.4.6"
                "1f903zd33i6hkjpsgwhqwi2wffnvkxbn6rv4mkgcjcqi7xr4zr55"))

(define rust-num-bigint-dig-0.8.4
  (crate-source "num-bigint-dig" "0.8.4"
                "0lb12df24wgxxbspz4gw1sf1kdqwvpdcpwq4fdlwg4gj41c1k16w"))

(define rust-num-conv-0.1.0
  (crate-source "num-conv" "0.1.0"
                "1ndiyg82q73783jq18isi71a7mjh56wxrk52rlvyx0mi5z9ibmai"))

(define rust-num-cpus-1.17.0
  (crate-source "num_cpus" "1.17.0"
                "0fxjazlng4z8cgbmsvbzv411wrg7x3hyxdq8nxixgzjswyylppwi"))

(define rust-num-enum-0.7.5
  (crate-source "num_enum" "0.7.5"
                "0k25hagf3xfgmj4j1zmvja1d6844jrmpginxpd3vhmxd41z7l85i"))

(define rust-num-enum-derive-0.7.5
  (crate-source "num_enum_derive" "0.7.5"
                "1mx4dgza8b9g16baybc00gg06jn4cf17h45p0fr3qx5nw5fkccpz"))

(define rust-num-integer-0.1.46
  (crate-source "num-integer" "0.1.46"
                "13w5g54a9184cqlbsq80rnxw4jj4s0d8wv75jsq5r2lms8gncsbr"))

(define rust-num-iter-0.1.45
  (crate-source "num-iter" "0.1.45"
                "1gzm7vc5g9qsjjl3bqk9rz1h6raxhygbrcpbfl04swlh0i506a8l"))

(define rust-num-traits-0.2.19
  (crate-source "num-traits" "0.2.19"
                "0h984rhdkkqd4ny9cif7y2azl3xdfb7768hb9irhpsch4q3gq787"))

(define rust-number-prefix-0.4.0
  (crate-source "number_prefix" "0.4.0"
                "1wvh13wvlajqxkb1filsfzbrnq0vrmrw298v2j3sy82z1rm282w3"))

(define rust-object-0.37.3
  (crate-source "object" "0.37.3"
                "1zikiy9xhk6lfx1dn2gn2pxbnfpmlkn0byd7ib1n720x0cgj0xpz"))

(define rust-ocb3-0.1.0
  (crate-source "ocb3" "0.1.0"
                "1nyyj0rx870iv24ad8j2x55qlabald1pazkpslyq8727dhky15n1"))

(define rust-oid-registry-0.8.1
  (crate-source "oid-registry" "0.8.1"
                "1dxm6qkkkk4dq3ln1v83d80k8bvicm6mspsxrj3n06yy7pzhrx0j"))

(define rust-once-cell-1.21.3
  (crate-source "once_cell" "1.21.3"
                "0b9x77lb9f1j6nqgf5aka4s2qj0nly176bpbrv6f9iakk5ff3xa2"))

(define rust-once-cell-polyfill-1.70.1
  (crate-source "once_cell_polyfill" "1.70.1"
                "1bg0w99srq8h4mkl68l1mza2n2f2hvrg0n8vfa3izjr5nism32d4"))

(define rust-opaque-debug-0.3.1
  (crate-source "opaque-debug" "0.3.1"
                "10b3w0kydz5jf1ydyli5nv10gdfp97xh79bgz327d273bs46b3f0"))

(define rust-openssl-0.10.74
  (crate-source "openssl" "0.10.74"
                "0m5nxchp0lmkqclgxs4ym3sg9w340s7sslhglghnj8j18pfi9b94"))

(define rust-openssl-macros-0.1.1
  (crate-source "openssl-macros" "0.1.1"
                "173xxvfc63rr5ybwqwylsir0vq6xsj4kxiv4hmg4c3vscdmncj59"))

(define rust-openssl-probe-0.1.6
  (crate-source "openssl-probe" "0.1.6"
                "0bl52x55laalqb707k009h8kfawliwp992rlsvkzy49n47p2fpnh"))

(define rust-openssl-sys-0.9.110
  ;; TODO: Check bundled sources.
  (crate-source "openssl-sys" "0.9.110"
                "1qnqrvgahzn9yfxjz3v4i29x860x9dc2c84bisgv089wp9sh17qa"))

(define rust-opentelemetry-0.29.1
  (crate-source "opentelemetry" "0.29.1"
                "0v6ijlxs486yip2zbjdpgqc525q8l8k9s8ddz6b4ixvm4xz271wy"))

(define rust-opentelemetry-http-0.29.0
  (crate-source "opentelemetry-http" "0.29.0"
                "1vf86z9d4dr9msck3k2xan9w5k35rfk9bylhpnav9d97p0rapms6"))

(define rust-opentelemetry-otlp-0.29.0
  (crate-source "opentelemetry-otlp" "0.29.0"
                "0mjnx260qn4x1p9pyip35m7764kkszn087f0f6xcq5k9w07p56fq"))

(define rust-opentelemetry-proto-0.29.0
  (crate-source "opentelemetry-proto" "0.29.0"
                "1cq96c16hxsfvcd26ip1v3sg9952mi89snqdawc5whw14cjdlh4c"))

(define rust-opentelemetry-sdk-0.29.0
  (crate-source "opentelemetry_sdk" "0.29.0"
                "02r99lz30zrb8870vivww8cvwhdi78v5fv5sq6mr8wyls4hzppmg"))

(define rust-opentelemetry-semantic-conventions-0.29.0
  (crate-source "opentelemetry-semantic-conventions" "0.29.0"
                "1qvaf3wvf3b40rifklvi767krv7yn8cjzaasdn9m9agii6grmcl4"))

(define rust-option-ext-0.2.0
  (crate-source "option-ext" "0.2.0"
                "0zbf7cx8ib99frnlanpyikm1bx8qn8x602sw1n7bg6p9x94lyx04"))

(define rust-ordered-multimap-0.7.3
  (crate-source "ordered-multimap" "0.7.3"
                "0ygg08g2h381r3zbclba4zx4amm25zd2hsqqmlxljc00mvf3q829"))

(define rust-p256-0.13.2
  (crate-source "p256" "0.13.2"
                "0jyd3c3k239ybs59ixpnl7dqkmm072fr1js8kh7ldx58bzc3m1n9"))

(define rust-p384-0.13.1
  (crate-source "p384" "0.13.1"
                "1dnnp133mbpp72mfss3fhm8wx3yp3p3abdhlix27v92j19kz2hpy"))

(define rust-p521-0.13.3
  (crate-source "p521" "0.13.3"
                "1cl5y2aypa1vxg181a0na3abndz1981pfdp2zkyml88z3wbf5j8g"))

(define rust-parking-2.2.1
  (crate-source "parking" "2.2.1"
                "1fnfgmzkfpjd69v4j9x737b1k8pnn054bvzcn5dm3pkgq595d3gk"))

(define rust-parking-lot-0.12.5
  (crate-source "parking_lot" "0.12.5"
                "06jsqh9aqmc94j2rlm8gpccilqm6bskbd67zf6ypfc0f4m9p91ck"))

(define rust-parking-lot-core-0.9.12
  (crate-source "parking_lot_core" "0.9.12"
                "1hb4rggy70fwa1w9nb0svbyflzdc69h047482v2z3sx2hmcnh896"))

(define rust-password-hash-0.5.0
  (crate-source "password-hash" "0.5.0"
                "0ri1mim11zk0a9s40zdi288dfqvmdiryc7lw8vl46b59ifa08vrl"))

(define rust-paste-1.0.15
  (crate-source "paste" "1.0.15"
                "02pxffpdqkapy292harq6asfjvadgp1s005fip9ljfsn9fvxgh2p"))

(define rust-pbkdf2-0.12.2
  (crate-source "pbkdf2" "0.12.2"
                "1wms79jh4flpy1zi8xdp4h8ccxv4d85adc6zjagknvppc5vnmvgq"))

(define rust-pem-3.0.6
  (crate-source "pem" "3.0.6"
                "1glia9vv51wx79cysqxgdha6g1bwbbr20bfhijlk2nxw4qycac0x"))

(define rust-pem-rfc7468-0.7.0
  (crate-source "pem-rfc7468" "0.7.0"
                "04l4852scl4zdva31c1z6jafbak0ni5pi0j38ml108zwzjdrrcw8"))

(define rust-percent-encoding-2.3.2
  (crate-source "percent-encoding" "2.3.2"
                "083jv1ai930azvawz2khv7w73xh8mnylk7i578cifndjn5y64kwv"))

(define rust-pest-2.8.3
  (crate-source "pest" "2.8.3"
                "1x3xc1s5vhwswmmr51i60kfbcnp1zgdblsxbqd8dxvs0l0hpb7lq"))

(define rust-pest-derive-2.8.3
  (crate-source "pest_derive" "2.8.3"
                "1pp2g39k2vjdyzr89k8zx5y7pp3np4iv635jpyxzmfhd0fisjz8q"))

(define rust-pest-generator-2.8.3
  (crate-source "pest_generator" "2.8.3"
                "0hr80m5xzzrhzjvnmbawk72cxvn0ssc5j216gblynmspizch3d29"))

(define rust-pest-meta-2.8.3
  (crate-source "pest_meta" "2.8.3"
                "0nh6w1mv8hx0p1jli8s12j2w62ia2apsbyl69nf07yg9zqn7mwkj"))

(define rust-petgraph-0.6.5
  (crate-source "petgraph" "0.6.5"
                "1ns7mbxidnn2pqahbbjccxkrqkrll2i5rbxx43ns6rh6fn3cridl"))

(define rust-petgraph-0.8.3
  (crate-source "petgraph" "0.8.3"
                "0mblnaqbx1y20h5y7pz6y11hk9jjk6k87lsmn7jxaq3hm67ba0c7"))

(define rust-phf-0.12.1
  (crate-source "phf" "0.12.1"
                "1dz85g1wshfca83mrq3va9rm9n8qcdjlpv1i3908y5zc9j4p6cli"))

(define rust-phf-0.13.1
  (crate-source "phf" "0.13.1"
                "1pzswx5gdglgjgp4azyzwyr4gh031r0kcnpqq6jblga72z3jsmn1"))

(define rust-phf-codegen-0.13.1
  (crate-source "phf_codegen" "0.13.1"
                "1qfnsl2hiny0yg4lwn888xla5iwccszgxnx8dhbwl6s2h2fpzaj9"))

(define rust-phf-generator-0.13.1
  (crate-source "phf_generator" "0.13.1"
                "0dwpp11l41dy9mag4phkyyvhpf66lwbp79q3ik44wmhyfqxcwnhk"))

(define rust-phf-macros-0.13.1
  (crate-source "phf_macros" "0.13.1"
                "1vv9h8pr7xh18sigpvq1hxc8q9nmjmv6gdpqsp65krxiahmh6bw1"))

(define rust-phf-shared-0.11.3
  (crate-source "phf_shared" "0.11.3"
                "1rallyvh28jqd9i916gk5gk2igdmzlgvv5q0l3xbf3m6y8pbrsk7"))

(define rust-phf-shared-0.12.1
  (crate-source "phf_shared" "0.12.1"
                "10cr16wpmbjxd7w6k98sxw9yw3zxnzscybl9jzyq3digi045a006"))

(define rust-phf-shared-0.13.1
  (crate-source "phf_shared" "0.13.1"
                "0rpjchnswm0x5l4mz9xqfpw0j4w68sjvyqrdrv13h7lqqmmyyzz5"))

(define rust-pin-project-1.1.10
  (crate-source "pin-project" "1.1.10"
                "12kadbnfm1f43cyadw9gsbyln1cy7vj764wz5c8wxaiza3filzv7"))

(define rust-pin-project-internal-1.1.10
  (crate-source "pin-project-internal" "1.1.10"
                "0qgqzfl0f4lzaz7yl5llhbg97g68r15kljzihaw9wm64z17qx4bf"))

(define rust-pin-project-lite-0.2.16
  (crate-source "pin-project-lite" "0.2.16"
                "16wzc7z7dfkf9bmjin22f5282783f6mdksnr0nv0j5ym5f9gyg1v"))

(define rust-pin-utils-0.1.0
  (crate-source "pin-utils" "0.1.0"
                "117ir7vslsl2z1a7qzhws4pd01cg2d3338c47swjyvqv2n60v1wb"))

(define rust-pkcs1-0.7.5
  (crate-source "pkcs1" "0.7.5"
                "0zz4mil3nchnxljdfs2k5ab1cjqn7kq5lqp62n9qfix01zqvkzy8"))

(define rust-pkcs8-0.10.2
  (crate-source "pkcs8" "0.10.2"
                "1dx7w21gvn07azszgqd3ryjhyphsrjrmq5mmz1fbxkj5g0vv4l7r"))

(define rust-pkg-config-0.3.32
  (crate-source "pkg-config" "0.3.32"
                "0k4h3gnzs94sjb2ix6jyksacs52cf1fanpwsmlhjnwrdnp8dppby"))

(define rust-pnet-base-0.35.0
  (crate-source "pnet_base" "0.35.0"
                "1xxj1ym32zqmy7m7ciiisv513rk9qis3p6x4mgrnmwbx0va91hgz"))

(define rust-pnet-datalink-0.35.0
  (crate-source "pnet_datalink" "0.35.0"
                "1dx7a9j2n7r463w8dv0wn1vasqnkhrajs79f6cm10qz11gn717p7"))

(define rust-pnet-sys-0.35.0
  ;; TODO: Check bundled sources.
  (crate-source "pnet_sys" "0.35.0"
                "0jqgl34w5jckvby74nh89hjc94m8m6pz7hjh21s0hsyvsk9l6ikx"))

(define rust-polyval-0.6.2
  (crate-source "polyval" "0.6.2"
                "09gs56vm36ls6pyxgh06gw2875z2x77r8b2km8q28fql0q6yc7wx"))

(define rust-portable-atomic-1.11.1
  (crate-source "portable-atomic" "1.11.1"
                "10s4cx9y3jvw0idip09ar52s2kymq8rq9a668f793shn1ar6fhpq"))

(define rust-postgres-protocol-0.6.9
  (crate-source "postgres-protocol" "0.6.9"
                "1m6g7zzcdj4pgw2gs3anh57ylzbabpynq9s8h23fn5mrar86bvzv"))

(define rust-postgres-types-0.2.11
  (crate-source "postgres-types" "0.2.11"
                "15bh03mqaclmv9jhzvrb3xdrgr1q0c6ardmfbg9ns1apq2vhaipg"))

(define rust-potential-utf-0.1.3
  (crate-source "potential_utf" "0.1.3"
                "12mhwvhpvvim6xqp6ifgkh1sniv9j2cmid6axn10fnjvpsnikpw4"))

(define rust-powerfmt-0.2.0
  (crate-source "powerfmt" "0.2.0"
                "14ckj2xdpkhv3h6l5sdmb9f1d57z8hbfpdldjc2vl5givq2y77j3"))

(define rust-ppmd-rust-1.2.1
  (crate-source "ppmd-rust" "1.2.1"
                "16zm5yjm32bq1kwsbni4bz6mm00dhjww7pl6xv4licyii8fn8d68"))

(define rust-ppv-lite86-0.2.21
  (crate-source "ppv-lite86" "0.2.21"
                "1abxx6qz5qnd43br1dd9b2savpihzjza8gb4fbzdql1gxp2f7sl5"))

(define rust-precomputed-hash-0.1.1
  (crate-source "precomputed-hash" "0.1.1"
                "075k9bfy39jhs53cb2fpb9klfakx2glxnf28zdw08ws6lgpq6lwj"))

(define rust-prettyplease-0.2.37
  (crate-source "prettyplease" "0.2.37"
                "0azn11i1kh0byabhsgab6kqs74zyrg69xkirzgqyhz6xmjnsi727"))

(define rust-prettytable-rs-0.10.0
  (crate-source "prettytable-rs" "0.10.0"
                "0nnryfnahfwy0yxhv4nsp1id25k00cybx3ih8xjsp9haa43mx8pf"))

(define rust-primeorder-0.13.6
  (crate-source "primeorder" "0.13.6"
                "1rp16710mxksagcjnxqjjq9r9wf5vf72fs8wxffnvhb6i6hiqgim"))

(define rust-privdrop-0.5.6
  (crate-source "privdrop" "0.5.6"
                "03slfr61nl3zv9343qkldnp4vr8yim5vcsclily61j986xd2lwkh"))

(define rust-proc-macro-crate-3.4.0
  (crate-source "proc-macro-crate" "3.4.0"
                "10v9qi51n4phn1lrj5r94kjq7yhci9jrkqnn6wpan05yjsgb3711"))

(define rust-proc-macro-error-1.0.4
  (crate-source "proc-macro-error" "1.0.4"
                "1373bhxaf0pagd8zkyd03kkx6bchzf6g0dkwrwzsnal9z47lj9fs"))

(define rust-proc-macro-error-attr-1.0.4
  (crate-source "proc-macro-error-attr" "1.0.4"
                "0sgq6m5jfmasmwwy8x4mjygx5l7kp8s4j60bv25ckv2j1qc41gm1"))

(define rust-proc-macro-error-attr2-2.0.0
  (crate-source "proc-macro-error-attr2" "2.0.0"
                "1ifzi763l7swl258d8ar4wbpxj4c9c2im7zy89avm6xv6vgl5pln"))

(define rust-proc-macro-error2-2.0.1
  (crate-source "proc-macro-error2" "2.0.1"
                "00lq21vgh7mvyx51nwxwf822w2fpww1x0z8z0q47p8705g2hbv0i"))

(define rust-proc-macro2-1.0.101
  (crate-source "proc-macro2" "1.0.101"
                "1pijhychkpl7rcyf1h7mfk6gjfii1ywf5n0snmnqs5g4hvyl7bl9"))

(define rust-prometheus-0.14.0
  (crate-source "prometheus" "0.14.0"
                "0fpl98whrg5j4bpb3qfswii4yfa58zws7rl7rnd0m58bimnk599w"))

(define rust-prost-0.13.5
  (crate-source "prost" "0.13.5"
                "1r8yi6zxxwv9gq5ia9p55nspgwmchs94sqpp64x33v5k3njgm5i7"))

(define rust-prost-derive-0.13.5
  (crate-source "prost-derive" "0.13.5"
                "0kgc9gbzsa998xixblfi3kfydka64zqf6rmpm53b761cjxbxfmla"))

(define rust-proxy-header-0.1.2
  (crate-source "proxy-header" "0.1.2"
                "0rg0w3328qxghi7dcwnfi99hjpchqabyjs9i1j2bmpyx7pv9656w"))

(define rust-psl-2.1.151
  (crate-source "psl" "2.1.151"
                "1nal0v7m3s6axkdl58q1mki15mysz5wyd728afz4m1985j6filkg"))

(define rust-psl-types-2.0.11
  (crate-source "psl-types" "2.0.11"
                "1b3cz1q07iy744a39smykra2j83nv8vmni6la37wnx3ax17jkjrk"))

(define rust-ptr-meta-0.3.1
  (crate-source "ptr_meta" "0.3.1"
                "0yaa4bvghj0rygqjlcd4lkcid58pcywxmjzisihsz5hibbwhr6hb"))

(define rust-ptr-meta-derive-0.3.1
  (crate-source "ptr_meta_derive" "0.3.1"
                "1qbg3malg24dmiszfddd7n69g3rb7vl7nxj67gchh4ky19yqcivk"))

(define rust-pure-rust-locales-0.8.2
  (crate-source "pure-rust-locales" "0.8.2"
                "03cak4k53a8iiz9ra0ydz2dfmx578qgwi23d1jlswhbm5nnpb5l6"))

(define rust-pwhash-1.0.0
  (crate-source "pwhash" "1.0.0"
                "0mjwpk9qrqm0yh94avn9ampnxbkq92i8bcfrd5g497czzbc3m6j1"))

(define rust-quick-cache-0.6.18
  (crate-source "quick_cache" "0.6.18"
                "1wry41wn608kyb9171p12mh68i5s0wh5vdbf9wls6lzrisl49nks"))

(define rust-quick-xml-0.31.0
  (crate-source "quick-xml" "0.31.0"
                "0cravqanylzh5cq2v6hzlfqgxcid5nrp2snnb3pf4m0and2a610h"))

(define rust-quick-xml-0.32.0
  (crate-source "quick-xml" "0.32.0"
                "1hk9x4fij5kq1mnn7gmxz1hpv8s9wnnj4gx4ly7hw3mn71c6wfhx"))

(define rust-quick-xml-0.38.3
  (crate-source "quick-xml" "0.38.3"
                "12bvsbnnmlnq9xg9in3h3080ag3sisafgpcn7lqyzhkz93kk58j2"))

(define rust-quinn-0.11.9
  (crate-source "quinn" "0.11.9"
                "086gzj666dr3slmlynkvxlndy28hahgl361d6bf93hk3i6ahmqmr"))

(define rust-quinn-proto-0.11.13
  (crate-source "quinn-proto" "0.11.13"
                "0cca3mgja9p4w66f6sl1kfhj8rdf4mwsg1jxzssh9g63n14np47i"))

(define rust-quinn-udp-0.5.14
  (crate-source "quinn-udp" "0.5.14"
                "1gacawr17a2zkyri0r3m0lc9spzmxbq1by3ilyb8v2mdvjhcdpmd"))

(define rust-quote-1.0.41
  (crate-source "quote" "1.0.41"
                "1lg108nb57lwbqlnpsii89cchk6i8pkcvrv88xh1p7a9gdz7c9ff"))

(define rust-r-efi-5.3.0
  (crate-source "r-efi" "5.3.0"
                "03sbfm3g7myvzyylff6qaxk4z6fy76yv860yy66jiswc2m6b7kb9"))

(define rust-r2d2-0.8.10
  (crate-source "r2d2" "0.8.10"
                "14qw32y4m564xb1f5ya8ii7dwqyknvk8bsx2r0lljlmn7zxqbpji"))

(define rust-radium-0.7.0
  (crate-source "radium" "0.7.0"
                "02cxfi3ky3c4yhyqx9axqwhyaca804ws46nn4gc1imbk94nzycyw"))

(define rust-radix-trie-0.2.1
  (crate-source "radix_trie" "0.2.1"
                "1zaq3im5ss03w91ij11cj97vvzc5y1f3064d9pi2ysnwziww2sf0"))

(define rust-radix-trie-0.3.0
  (crate-source "radix_trie" "0.3.0"
                "16i8lgwvnhay37hbrf1mg64hba1s4dghnx7gfcmgqdydgl132i1v"))

(define rust-rancor-0.1.1
  (crate-source "rancor" "0.1.1"
                "1vl1y0yhw40j3g6b2h9jgkfjp0pg000cia8xashc49qm71rflqx0"))

(define rust-rand-0.7.3
  (crate-source "rand" "0.7.3"
                "00sdaimkbz491qgi6qxkv582yivl32m2jd401kzbn94vsiwicsva"))

(define rust-rand-0.8.5
  (crate-source "rand" "0.8.5"
                "013l6931nn7gkc23jz5mm3qdhf93jjf0fg64nz2lp4i51qd8vbrl"))

(define rust-rand-0.9.2
  (crate-source "rand" "0.9.2"
                "1lah73ainvrgl7brcxx0pwhpnqa3sm3qaj672034jz8i0q7pgckd"))

(define rust-rand-chacha-0.2.2
  (crate-source "rand_chacha" "0.2.2"
                "00il36fkdbsmpr99p9ksmmp6dn1md7rmnwmz0rr77jbrca2yvj7l"))

(define rust-rand-chacha-0.3.1
  (crate-source "rand_chacha" "0.3.1"
                "123x2adin558xbhvqb8w4f6syjsdkmqff8cxwhmjacpsl1ihmhg6"))

(define rust-rand-chacha-0.9.0
  (crate-source "rand_chacha" "0.9.0"
                "1jr5ygix7r60pz0s1cv3ms1f6pd1i9pcdmnxzzhjc3zn3mgjn0nk"))

(define rust-rand-core-0.5.1
  (crate-source "rand_core" "0.5.1"
                "06bdvx08v3rkz451cm7z59xwwqn1rkfh6v9ay77b14f8dwlybgch"))

(define rust-rand-core-0.6.4
  (crate-source "rand_core" "0.6.4"
                "0b4j2v4cb5krak1pv6kakv4sz6xcwbrmy2zckc32hsigbrwy82zc"))

(define rust-rand-core-0.9.3
  (crate-source "rand_core" "0.9.3"
                "0f3xhf16yks5ic6kmgxcpv1ngdhp48mmfy4ag82i1wnwh8ws3ncr"))

(define rust-rand-hc-0.2.0
  (crate-source "rand_hc" "0.2.0"
                "0g31sqwpmsirdlwr0svnacr4dbqyz339im4ssl9738cjgfpjjcfa"))

(define rust-rasn-0.10.6
  (crate-source "rasn" "0.10.6"
                "1vs3w47a0s0nxpx43q5bgn60zmrfdw8fnkhyw3d40ph8fajg7pkn"))

(define rust-rasn-cms-0.10.6
  (crate-source "rasn-cms" "0.10.6"
                "104ky3r0kh6a9anrh1k9wvbmilc27a2s6iij0b8l3yqbdhdmpm09"))

(define rust-rasn-derive-0.10.6
  (crate-source "rasn-derive" "0.10.6"
                "0bdcwah65kx2x2imaqhlm44hsmbw8idk1kp7nm1fjck2w41gvla8"))

(define rust-rasn-pkix-0.10.6
  (crate-source "rasn-pkix" "0.10.6"
                "1sgqcq8zsl6byswbrmbfbgrks3x11xyns83jsydxpx78hd0mr0kc"))

(define rust-rayon-1.11.0
  (crate-source "rayon" "1.11.0"
                "13x5fxb7rn4j2yw0cr26n7782jkc7rjzmdkg42qxk3xz0p8033rn"))

(define rust-rayon-core-1.13.0
  (crate-source "rayon-core" "1.13.0"
                "14dbr0sq83a6lf1rfjq5xdpk5r6zgzvmzs5j6110vlv2007qpq92"))

(define rust-rcgen-0.12.1
  (crate-source "rcgen" "0.12.1"
                "1qg10xvayyxhkcjk1x3g6n59a5rq6iaw6vmmrmyvqg0zmjw6sh28"))

(define rust-rcgen-0.14.5
  (crate-source "rcgen" "0.14.5"
                "19gp2qm0qg3j8qpx6k1vnzh6sm50zxyqprvl29havw98dc647bjz"))

(define rust-rdkafka-0.38.0
  (crate-source "rdkafka" "0.38.0"
                "1h45phfsaihlg08kp23ffkr7x15kgypzdsmjlp9a1gmv5pbmc62z"))

(define rust-rdkafka-sys-4.9.0+2.10.0
  ;; TODO: Check bundled sources.
  (crate-source "rdkafka-sys" "4.9.0+2.10.0"
                "0wi8h3apjyjbypyf5xvs1xhqn60f519l6glz4qcdfm63ifjdqc2j"))

(define rust-redis-0.32.7
  (crate-source "redis" "0.32.7"
                "0i7grxrnqwa201r4kgcg4476x75drhmi2ifak3ks7dpszrkwfk01"))

(define rust-redox-syscall-0.5.18
  (crate-source "redox_syscall" "0.5.18"
                "0b9n38zsxylql36vybw18if68yc9jczxmbyzdwyhb9sifmag4azd"))

(define rust-redox-users-0.4.6
  (crate-source "redox_users" "0.4.6"
                "0hya2cxx6hxmjfxzv9n8rjl5igpychav7zfi1f81pz6i4krry05s"))

(define rust-redox-users-0.5.2
  (crate-source "redox_users" "0.5.2"
                "1b17q7gf7w8b1vvl53bxna24xl983yn7bd00gfbii74bcg30irm4"))

(define rust-ref-cast-1.0.25
  (crate-source "ref-cast" "1.0.25"
                "0zdzc34qjva9xxgs889z5iz787g81hznk12zbk4g2xkgwq530m7k"))

(define rust-ref-cast-impl-1.0.25
  (crate-source "ref-cast-impl" "1.0.25"
                "1nkhn1fklmn342z5c4mzfzlxddv3x8yhxwwk02cj06djvh36065p"))

(define rust-regex-1.12.2
  (crate-source "regex" "1.12.2"
                "1m14zkg6xmkb0q5ah3y39cmggclsjdr1wpxfa4kf5wvm3wcw0fw4"))

(define rust-regex-automata-0.4.13
  (crate-source "regex-automata" "0.4.13"
                "070z0j23pjfidqz0z89id1fca4p572wxpcr20a0qsv68bbrclxjj"))

(define rust-regex-syntax-0.8.8
  (crate-source "regex-syntax" "0.8.8"
                "0n7ggnpk0r32rzgnycy5xrc1yp2kq19m6pz98ch3c6dkaxw9hbbs"))

(define rust-rend-0.5.3
  (crate-source "rend" "0.5.3"
                "1rknl9l1s3x67zizrxz1n3k8w5z7z54dqzsdlrahgwn22zrxxnna"))

(define rust-reqwest-0.11.27
  (crate-source "reqwest" "0.11.27"
                "0qjary4hpplpgdi62d2m0xvbn6lnzckwffm0rgkm2x51023m6ryx"))

(define rust-reqwest-0.12.24
  (crate-source "reqwest" "0.12.24"
                "0vx3f2n6hfnv81y66v5wayrqh6jlzz4gakky88m0hywz1d0lc2cx"))

(define rust-resolv-conf-0.7.5
  (crate-source "resolv-conf" "0.7.5"
                "16b7dm98r65b5d918zdyn5lmpi0ssaavvsjbvq1a2nyj1frqjdvb"))

(define rust-rev-lines-0.3.0
  (crate-source "rev_lines" "0.3.0"
                "0pzh5g31ljhkzinpahg8zq05c0gz54q307ayz89vzk55qxm92qpd"))

(define rust-rfc6979-0.4.0
  (crate-source "rfc6979" "0.4.0"
                "1chw95jgcfrysyzsq6a10b1j5qb7bagkx8h0wda4lv25in02mpgq"))

(define rust-ring-0.17.14
  (crate-source "ring" "0.17.14"
                "1dw32gv19ccq4hsx3ribhpdzri1vnrlcfqb2vj41xn4l49n9ws54"))

(define rust-ringbuffer-spsc-0.1.15
  (crate-source "ringbuffer-spsc" "0.1.15"
                "0d9f962m3148h26rmdvlra4dy0q6n59nm1bzrpkk5cl1lsh7lgld"))

(define rust-ripemd-0.1.3
  (crate-source "ripemd" "0.1.3"
                "17xh5yl9wjjj2v18rh3m8ajlmdjg1yj13l6r9rj3mnbss4i444mx"))

(define rust-rkyv-0.8.12
  (crate-source "rkyv" "0.8.12"
                "197zyd1hxn43da8m5c07h99mikx19p9nb6wsis0i6xq0dyr419im"))

(define rust-rkyv-derive-0.8.12
  (crate-source "rkyv_derive" "0.8.12"
                "10n44h1rdbjrfa0p3wqribpj5l0nwir6azyr6w1y0hgzfgqzb0xx"))

(define rust-rle-decode-fast-1.0.3
  (crate-source "rle-decode-fast" "1.0.3"
                "08kljzl29rpm12fiz0qj5pask49aiswdvcjigdcq73s224rgd0im"))

(define rust-roaring-0.11.2
  (crate-source "roaring" "0.11.2"
                "183q32hrx81c1b5b0v64yc9c6l79sz4s0dspbm5dfcnvbs86m3gh"))

(define rust-rocksdb-0.24.0
  (crate-source "rocksdb" "0.24.0"
                "0kz3zi0zzhilc7wx9s03zx49g58iaki6601cv03vszdis80azdyx"))

(define rust-ron-0.11.0
  (crate-source "ron" "0.11.0"
                "0s6l0hlkxkk31iq6z4y4cy68szyy5dx7ffai4qd1yilyr06082fv"))

(define rust-rpassword-7.4.0
  (crate-source "rpassword" "7.4.0"
                "0ffzfff51pl95a7px9gwlz243mn3vxyw7klcxhhng7049yvcim36"))

(define rust-rsa-0.9.8
  (crate-source "rsa" "0.9.8"
                "06v9zl604jsqjajm647l9jjirn7k4lc8lmvys6hmqshpxp0qm4kq"))

(define rust-rtoolbox-0.0.3
  (crate-source "rtoolbox" "0.0.3"
                "0vvz9p8wdzspwd7hk0cxyjr0i49cfqks5q02drym5glz4h5rgk57"))

(define rust-rtrb-0.3.2
  (crate-source "rtrb" "0.3.2"
                "1fp3rjd8bzx89wdx5g7c42rxqzlyd4x2ds22wh3sh3ly3bm8i0xd"))

(define rust-rusqlite-0.37.0
  (crate-source "rusqlite" "0.37.0"
                "0gqzwykyfaaddq5rg1jk0940wby6ifarnwp3fcakbq90ggjscp0n"))

(define rust-rust-ini-0.21.3
  (crate-source "rust-ini" "0.21.3"
                "1iw8yss8ncygd9yx5ay5gmr2jk7vcyv1d0d5pr1jlfcncqmqsvkr"))

(define rust-rust-s3-0.35.1
  (crate-source "rust-s3" "0.35.1"
                "0cqmb642rlvbs1pwv80mmfbw6y82m76pgmrpykf0jhhz7cskzpy3"))

(define rust-rust-stemmers-1.2.0
  (crate-source "rust-stemmers" "1.2.0"
                "0m6acgdflrrcm17dj7lp7x4sfqqhga24qynv660qinwz04v20sp4"))

(define rust-rustc-demangle-0.1.26
  (crate-source "rustc-demangle" "0.1.26"
                "1kja3nb0yhlm4j2p1hl8d7sjmn2g9fa1s4pj0qma5kj2lcndkxsn"))

(define rust-rustc-hash-1.1.0
  (crate-source "rustc-hash" "1.1.0"
                "1qkc5khrmv5pqi5l5ca9p5nl5hs742cagrndhbrlk3dhlrx3zm08"))

(define rust-rustc-hash-2.1.1
  (crate-source "rustc-hash" "2.1.1"
                "03gz5lvd9ghcwsal022cgkq67dmimcgdjghfb5yb5d352ga06xrm"))

(define rust-rustc-version-0.2.3
  (crate-source "rustc_version" "0.2.3"
                "02h3x57lcr8l2pm0a645s9whdh33pn5cnrwvn5cb57vcrc53x3hk"))

(define rust-rustc-version-0.4.1
  (crate-source "rustc_version" "0.4.1"
                "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))

(define rust-rusticata-macros-4.1.0
  (crate-source "rusticata-macros" "4.1.0"
                "0ch67lljmgl5pfrlb90bl5kkp2x6yby1qaxnpnd0p5g9xjkc9w7s"))

(define rust-rustix-1.1.2
  (crate-source "rustix" "1.1.2"
                "0gpz343xfzx16x82s1x336n0kr49j02cvhgxdvaq86jmqnigh5fd"))

(define rust-rustls-0.21.12
  (crate-source "rustls" "0.21.12"
                "0gjdg2a9r81sdwkyw3n5yfbkrr6p9gyk3xr2kcsr3cs83x6s2miz"))

(define rust-rustls-0.23.33
  (crate-source "rustls" "0.23.33"
                "0b7qwspimfxf18mammg1yammlsyn4f6iahz0lnbvn06ajsj087km"))

(define rust-rustls-native-certs-0.6.3
  (crate-source "rustls-native-certs" "0.6.3"
                "007zind70rd5rfsrkdcfm8vn09j8sg02phg9334kark6rdscxam9"))

(define rust-rustls-native-certs-0.7.3
  (crate-source "rustls-native-certs" "0.7.3"
                "1r9ib5gwkfci2wbqnbh44nigvrfgxs4n1x89js82w97dxsab7gz5"))

(define rust-rustls-native-certs-0.8.2
  (crate-source "rustls-native-certs" "0.8.2"
                "08vr6gyz78c4zmbi8r307pybyrs7hf81wl5s35hm7h5hxcbxk04r"))

(define rust-rustls-pemfile-1.0.4
  (crate-source "rustls-pemfile" "1.0.4"
                "1324n5bcns0rnw6vywr5agff3rwfvzphi7rmbyzwnv6glkhclx0w"))

(define rust-rustls-pemfile-2.2.0
  (crate-source "rustls-pemfile" "2.2.0"
                "0l3f3mrfkgdjrava7ibwzgwc4h3dljw3pdkbsi9rkwz3zvji9qyw"))

(define rust-rustls-pki-types-1.12.0
  (crate-source "rustls-pki-types" "1.12.0"
                "0yawbdpix8jif6s8zj1p2hbyb7y3bj66fhx0y7hyf4qh4964m6i2"))

(define rust-rustls-platform-verifier-0.6.1
  (crate-source "rustls-platform-verifier" "0.6.1"
                "186mcy6zhizfrafsl6j9vmn28fhcmm9hcls2d4m3gb3cb68syndy"))

(define rust-rustls-platform-verifier-android-0.1.1
  (crate-source "rustls-platform-verifier-android" "0.1.1"
                "13vq6sxsgz9547xm2zbdxiw8x7ad1g8n8ax6xvxsjqszk7q6awgq"))

(define rust-rustls-webpki-0.101.7
  (crate-source "rustls-webpki" "0.101.7"
                "0rapfhpkqp75552i8r0y7f4vq7csb4k7gjjans0df73sxv8paqlb"))

(define rust-rustls-webpki-0.102.8
  (crate-source "rustls-webpki" "0.102.8"
                "1sdy8ks86b7jpabpnb2px2s7f1sq8v0nqf6fnlvwzm4vfk41pjk4"))

(define rust-rustls-webpki-0.103.7
  (crate-source "rustls-webpki" "0.103.7"
                "1gqlsd0yqiqch97g0wbsnbmyrp75j6nbzfpf8dmhxa78j50ky2z1"))

(define rust-rustversion-1.0.22
  (crate-source "rustversion" "1.0.22"
                "0vfl70jhv72scd9rfqgr2n11m5i9l1acnk684m2w83w0zbqdx75k"))

(define rust-rustyxml-0.3.0
  (crate-source "RustyXML" "0.3.0"
                "1iaq1sclma2ri7nkhs77z6q5ivzd12nnas2lq0vxw5ijxqlwwnlb"))

(define rust-ryu-1.0.20
  (crate-source "ryu" "1.0.20"
                "07s855l8sb333h6bpn24pka5sp7hjk2w667xy6a0khkf6sqv5lr8"))

(define rust-salsa20-0.10.2
  (crate-source "salsa20" "0.10.2"
                "04w211x17xzny53f83p8f7cj7k2hi8zck282q5aajwqzydd2z8lp"))

(define rust-same-file-1.0.6
  (crate-source "same-file" "1.0.6"
                "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))

(define rust-saturating-0.1.0
  (crate-source "saturating" "0.1.0"
                "0w8asisv01gfc73vsa1a3c8sayqqlzq5sisx3z2m3v1q5y5ygs7c"))

(define rust-scc-2.4.0
  (crate-source "scc" "2.4.0"
                "1k2nwz3bysf1s3r5g437vq9xfm9i4sadfzn5c0k8xx7ynx3g1rj6"))

(define rust-schannel-0.1.28
  (crate-source "schannel" "0.1.28"
                "1qb6s5gyxfz2inz753a4z3mc1d266mwvz0c5w7ppd3h44swq27c9"))

(define rust-scheduled-thread-pool-0.2.7
  (crate-source "scheduled-thread-pool" "0.2.7"
                "068s77f9xcpvzl70nsxk8750dzzc6f9pixajhd979815cj0ndg1w"))

(define rust-schemars-0.8.22
  (crate-source "schemars" "0.8.22"
                "05an9nbi18ynyxv1rjmwbg6j08j0496hd64mjggh53mwp3hjmgrz"))

(define rust-schemars-0.9.0
  (crate-source "schemars" "0.9.0"
                "0pqncln5hqbzbl2r3yayyr4a82jjf93h2cfxrn0xamvx77wr3lac"))

(define rust-schemars-1.0.4
  (crate-source "schemars" "1.0.4"
                "1l7w773jfk6mz0v8wpahp60aslksjijlbm65ysi4y5mwj520rll2"))

(define rust-schemars-derive-0.8.22
  (crate-source "schemars_derive" "0.8.22"
                "0kakyzrp5801s4i043l4ilv96lzimnlh01pap958h66n99w6bqij"))

(define rust-scopeguard-1.2.0
  (crate-source "scopeguard" "1.2.0"
                "0jcz9sd47zlsgcnm1hdw0664krxwb5gczlif4qngj2aif8vky54l"))

(define rust-scrypt-0.11.0
  (crate-source "scrypt" "0.11.0"
                "07zxfaqpns9jn0mnxm7wj3ksqsinyfpirkav1f7kc2bchs2s65h5"))

(define rust-sct-0.7.1
  (crate-source "sct" "0.7.1"
                "056lmi2xkzdg1dbai6ha3n57s18cbip4pnmpdhyljli3m99n216s"))

(define rust-sdd-3.0.10
  (crate-source "sdd" "3.0.10"
                "1jj1brjjasx7r3lf6iyhhrpglx47vzr0z1qi1n0fcszjzv5wy3a9"))

(define rust-sec1-0.7.3
  (crate-source "sec1" "0.7.3"
                "1p273j8c87pid6a1iyyc7vxbvifrw55wbxgr0dh3l8vnbxb7msfk"))

(define rust-secrecy-0.8.0
  (crate-source "secrecy" "0.8.0"
                "07p9h2bpkkg61f1fzzdqqbf74kwv1gg095r1cdmjzzbcl17cblcv"))

(define rust-security-framework-2.11.1
  (crate-source "security-framework" "2.11.1"
                "00ldclwx78dm61v7wkach9lcx76awlrv0fdgjdwch4dmy12j4yw9"))

(define rust-security-framework-3.5.1
  (crate-source "security-framework" "3.5.1"
                "1vz6pf5qjgx8s0hg805hq6qbcqnll6fs63irvrpgcc7qx91p6adk"))

(define rust-security-framework-sys-2.15.0
  ;; TODO: Check bundled sources.
  (crate-source "security-framework-sys" "2.15.0"
                "1h6mijxnfrwvl1y4dzwn3m877j6dqp9qn3g37i954j5czazhq7yc"))

(define rust-semver-0.9.0
  (crate-source "semver" "0.9.0"
                "00q4lkcj0rrgbhviv9sd4p6qmdsipkwkbra7rh11jrhq5kpvjzhx"))

(define rust-semver-1.0.27
  (crate-source "semver" "1.0.27"
                "1qmi3akfrnqc2hfkdgcxhld5bv961wbk8my3ascv5068mc5fnryp"))

(define rust-semver-parser-0.7.0
  (crate-source "semver-parser" "0.7.0"
                "18vhypw6zgccnrlm5ps1pwa0khz7ry927iznpr88b87cagr1v2iq"))

(define rust-sequoia-openpgp-2.0.0
  (crate-source "sequoia-openpgp" "2.0.0"
                "1s616nrmway3qm2wmrdgxrr5hc0bx7rsgaccp6fqnh93s31myph1"))

(define rust-serde-1.0.228
  (crate-source "serde" "1.0.228"
                "17mf4hhjxv5m90g42wmlbc61hdhlm6j9hwfkpcnd72rpgzm993ls"))

(define rust-serde-bytes-0.11.19
  (crate-source "serde_bytes" "0.11.19"
                "1a1y1v0r9akqyvprxnmpgc0i8wybqqpvgi01mi8qxn3rkrq41m55"))

(define rust-serde-core-1.0.228
  (crate-source "serde_core" "1.0.228"
                "1bb7id2xwx8izq50098s5j2sqrrvk31jbbrjqygyan6ask3qbls1"))

(define rust-serde-derive-1.0.228
  (crate-source "serde_derive" "1.0.228"
                "0y8xm7fvmr2kjcd029g9fijpndh8csv5m20g4bd76w8qschg4h6m"))

(define rust-serde-derive-internals-0.29.1
  (crate-source "serde_derive_internals" "0.29.1"
                "04g7macx819vbnxhi52cx0nhxi56xlhrybgwybyy7fb9m4h6mlhq"))

(define rust-serde-json-1.0.145
  (crate-source "serde_json" "1.0.145"
                "1767y6kxjf7gwpbv8bkhgwc50nhg46mqwm9gy9n122f7v1k6yaj0"))

(define rust-serde-nanos-0.1.4
  (crate-source "serde_nanos" "0.1.4"
                "1199n6aapb3cclbxgp6kzb6bx1cylg6ipbgyw0xcak3s6vq44cd9"))

(define rust-serde-qs-0.8.5
  (crate-source "serde_qs" "0.8.5"
                "19pngnlga4xnap85kdvn661662hf42lkkppp9sd04py7xs056wf7"))

(define rust-serde-repr-0.1.20
  (crate-source "serde_repr" "0.1.20"
                "1755gss3f6lwvv23pk7fhnjdkjw7609rcgjlr8vjg6791blf6php"))

(define rust-serde-urlencoded-0.7.1
  (crate-source "serde_urlencoded" "0.7.1"
                "1zgklbdaysj3230xivihs30qi5vkhigg323a9m62k8jwf4a1qjfk"))

(define rust-serde-with-1.14.0
  (crate-source "serde_with" "1.14.0"
                "1zqjlc9ypm8y0r9bcgdhh62zcdn2yzfxh31dsbn01gshkq35m2v7"))

(define rust-serde-with-3.15.0
  (crate-source "serde_with" "3.15.0"
                "1igclzmh6fcxjx6f0qfr0amqy5cj2qazgq1796w64lmj066cv4v0"))

(define rust-serde-with-macros-1.5.2
  (crate-source "serde_with_macros" "1.5.2"
                "10l0rsy0k61nvpn1brcfvzp8yfnvsqdgh6zdwp03qf85dzndd0p1"))

(define rust-serde-with-macros-3.15.0
  (crate-source "serde_with_macros" "3.15.0"
                "09qw900jb7qpf8khdlz4szgfpdsg6kswz8dgc5m045h8vf0c3rm7"))

(define rust-serde-yaml-0.9.34+deprecated
  (crate-source "serde_yaml" "0.9.34+deprecated"
                "0isba1fjyg3l6rxk156k600ilzr8fp7crv82rhal0rxz5qd1m2va"))

(define rust-serial-test-3.2.0
  (crate-source "serial_test" "3.2.0"
                "1a8zg87gi28952hzj363ykwd8p1ssrakl1gi3f4xdqa4y84q298v"))

(define rust-serial-test-derive-3.2.0
  (crate-source "serial_test_derive" "3.2.0"
                "1vwyz2k5kiy5jmba0fvp6ph8ia707801bz918n2ff7bm11d2csax"))

(define rust-sha-1-0.9.8
  (crate-source "sha-1" "0.9.8"
                "19jibp8l9k5v4dnhj5kfhaczdfd997h22qz0hin6pw9wvc9ngkcr"))

(define rust-sha1-0.10.6
  (crate-source "sha1" "0.10.6"
                "1fnnxlfg08xhkmwf2ahv634as30l1i3xhlhkvxflmasi5nd85gz3"))

(define rust-sha1-smol-1.0.1
  (crate-source "sha1_smol" "1.0.1"
                "0pbh2xjfnzgblws3hims0ib5bphv7r5rfdpizyh51vnzvnribymv"))

(define rust-sha1collisiondetection-0.3.4
  (crate-source "sha1collisiondetection" "0.3.4"
                "0jwnwrk1x78v9r16jnac2s4v1m2f5a19khwkx1vjh0d6whhn8q0z"))

(define rust-sha2-0.10.9
  (crate-source "sha2" "0.10.9"
                "10xjj843v31ghsksd9sl9y12qfc48157j1xpb8v1ml39jy0psl57"))

(define rust-sha2-0.9.9
  (crate-source "sha2" "0.9.9"
                "006q2f0ar26xcjxqz8zsncfgz86zqa5dkwlwv03rhx1rpzhs2n2d"))

(define rust-sha2-const-stable-0.1.0
  (crate-source "sha2-const-stable" "0.1.0"
                "1n9yz02vfyf6sp5hlnlzz497b2j49pvhiwpzh8xqjjh92579s5sz"))

(define rust-sha3-0.10.8
  (crate-source "sha3" "0.10.8"
                "0q5s3qlwnk8d5j34jya98j1v2p3009wdmnqdza3yydwgi8kjv1vm"))

(define rust-sharded-slab-0.1.7
  (crate-source "sharded-slab" "0.1.7"
                "1xipjr4nqsgw34k7a2cgj9zaasl2ds6jwn89886kww93d32a637l"))

(define rust-shellexpand-3.1.1
  (crate-source "shellexpand" "3.1.1"
                "1fwhid2r117rbis2f6lj8mpfjf0w6lq6nqfxjha86cb3vmjxy7wb"))

(define rust-shlex-1.3.0
  (crate-source "shlex" "1.3.0"
                "0r1y6bv26c1scpxvhg2cabimrmwgbp4p3wy6syj9n0c4s3q2znhg"))

(define rust-sieve-rs-0.7.0
  (crate-source "sieve-rs" "0.7.0"
                "1555ywdfk1sl2hvvbi4znalj7kqbchiv3z39bs8lzpvammp53nls"))

(define rust-signal-hook-registry-1.4.6
  (crate-source "signal-hook-registry" "1.4.6"
                "12y2v1ms5z111fymaw1v8k93m5chnkp21h0jknrydkj8zydp395j"))

(define rust-signatory-0.27.1
  (crate-source "signatory" "0.27.1"
                "0caznqsnc1kxf74kgs3zjd9h8zjj5473yxv8c17hf52p43w07qy1"))

(define rust-signature-2.2.0
  (crate-source "signature" "2.2.0"
                "1pi9hd5vqfr3q3k49k37z06p7gs5si0in32qia4mmr1dancr6m3p"))

(define rust-simd-adler32-0.3.7
  (crate-source "simd-adler32" "0.3.7"
                "1zkq40c3iajcnr5936gjp9jjh1lpzhy44p3dq3fiw75iwr1w2vfn"))

(define rust-simdutf8-0.1.5
  (crate-source "simdutf8" "0.1.5"
                "0vmpf7xaa0dnaikib5jlx6y4dxd3hxqz6l830qb079g7wcsgxag3"))

(define rust-siphasher-1.0.1
  (crate-source "siphasher" "1.0.1"
                "17f35782ma3fn6sh21c027kjmd227xyrx06ffi8gw4xzv9yry6an"))

(define rust-slab-0.4.11
  (crate-source "slab" "0.4.11"
                "12bm4s88rblq02jjbi1dw31984w61y2ldn13ifk5gsqgy97f8aks"))

(define rust-smallvec-1.15.1
  (crate-source "smallvec" "1.15.1"
                "00xxdxxpgyq5vjnpljvkmy99xij5rxgh913ii1v16kzynnivgcb7"))

(define rust-smtp-proto-0.2.0
  (crate-source "smtp-proto" "0.2.0"
                "0fi3wq62nz2751130ky1r8r2gbacd77w8kgss5yqsx9v9p3w2p6m"))

(define rust-snafu-0.7.5
  (crate-source "snafu" "0.7.5"
                "1mj2j2gfbf8mm1hr02zrbrqrh2zp01f61xgkx0lpln2w0ankgpp4"))

(define rust-snafu-derive-0.7.5
  (crate-source "snafu-derive" "0.7.5"
                "1gzy9rzggs090zf7hfvgp4lm1glrmg9qzh796686jnq7bxk7j04r"))

(define rust-socket2-0.5.10
  (crate-source "socket2" "0.5.10"
                "0y067ki5q946w91xlz2sb175pnfazizva6fi3kfp639mxnmpc8z2"))

(define rust-socket2-0.6.1
  (crate-source "socket2" "0.6.1"
                "109qn0kjhqi5zds84qyqi5wn72g8azjhmf4b04fkgkrkd48rw4hp"))

(define rust-spin-0.10.0
  (crate-source "spin" "0.10.0"
                "14g5sdsjf4wk2ys5dq8ivkq4rz57gphab2gcdzar5hnrk35lrznm"))

(define rust-spin-0.9.8
  (crate-source "spin" "0.9.8"
                "0rvam5r0p3a6qhc18scqpvpgb3ckzyqxpgdfyjnghh8ja7byi039"))

(define rust-spki-0.7.3
  (crate-source "spki" "0.7.3"
                "17fj8k5fmx4w9mp27l970clrh5qa7r5sjdvbsln987xhb34dc7nr"))

(define rust-stabby-36.2.2
  (crate-source "stabby" "36.2.2"
                "1y3rxj12xriiw9gdy4n5djip2i3i97xv4pzinmv2w327mx7fkdw9"))

(define rust-stabby-abi-36.2.2
  (crate-source "stabby-abi" "36.2.2"
                "06jcfc36qrmbm0c91cpwvjr0cybflmfxiqzzpx8lxdbnh8xsdiqd"))

(define rust-stabby-macros-36.2.2
  (crate-source "stabby-macros" "36.2.2"
                "058ncn4bc6q798fh1ldyq56j7shvydavw3qjkp3kxj8yc72pxjzf"))

(define rust-stable-deref-trait-1.2.1
  (crate-source "stable_deref_trait" "1.2.1"
                "15h5h73ppqyhdhx6ywxfj88azmrpml9gl6zp3pwy2malqa6vxqkc"))

(define rust-static-assertions-1.1.0
  (crate-source "static_assertions" "1.1.0"
                "0gsl6xmw10gvn3zs1rv99laj5ig7ylffnh71f9l34js4nr4r7sx2"))

(define rust-string-cache-0.8.9
  (crate-source "string_cache" "0.8.9"
                "03z7km2kzlwiv2r2qifq5riv4g8phazwng9wnvs3py3lzainnxxz"))

(define rust-stringprep-0.1.5
  (crate-source "stringprep" "0.1.5"
                "1cb3jis4h2b767csk272zw92lc6jzfzvh8d6m1cd86yqjb9z6kbv"))

(define rust-strsim-0.10.0
  (crate-source "strsim" "0.10.0"
                "08s69r4rcrahwnickvi0kq49z524ci50capybln83mg6b473qivk"))

(define rust-strsim-0.11.1
  (crate-source "strsim" "0.11.1"
                "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))

(define rust-subtle-2.6.1
  (crate-source "subtle" "2.6.1"
                "14ijxaymghbl1p0wql9cib5zlwiina7kall6w7g89csprkgbvhhk"))

(define rust-syn-1.0.109
  (crate-source "syn" "1.0.109"
                "0ds2if4600bd59wsv7jjgfkayfzy3hnazs394kz6zdkmna8l3dkj"))

(define rust-syn-2.0.107
  (crate-source "syn" "2.0.107"
                "06q8dmpafa19i1pqk9y5jhw0gz2nms6h2306xwhisig56kcxn9ia"))

(define rust-sync-wrapper-0.1.2
  (crate-source "sync_wrapper" "0.1.2"
                "0q01lyj0gr9a93n10nxsn8lwbzq97jqd6b768x17c8f7v7gccir0"))

(define rust-sync-wrapper-1.0.2
  (crate-source "sync_wrapper" "1.0.2"
                "0qvjyasd6w18mjg5xlaq5jgy84jsjfsvmnn12c13gypxbv75dwhb"))

(define rust-synstructure-0.13.2
  (crate-source "synstructure" "0.13.2"
                "1lh9lx3r3jb18f8sbj29am5hm9jymvbwh6jb1izsnnxgvgrp12kj"))

(define rust-system-configuration-0.5.1
  (crate-source "system-configuration" "0.5.1"
                "1rz0r30xn7fiyqay2dvzfy56cvaa3km74hnbz2d72p97bkf3lfms"))

(define rust-system-configuration-sys-0.5.0
  ;; TODO: Check bundled sources.
  (crate-source "system-configuration-sys" "0.5.0"
                "1jckxvdr37bay3i9v52izgy52dg690x5xfg3hd394sv2xf4b2px7"))

(define rust-tagptr-0.2.0
  (crate-source "tagptr" "0.2.0"
                "05r4mwvlsclx1ayj65hpzjv3dn4wpi8j4xm695vydccf9k7r683v"))

(define rust-tap-1.0.1
  (crate-source "tap" "1.0.1"
                "0sc3gl4nldqpvyhqi3bbd0l9k7fngrcl4zs47n314nqqk4bpx4sm"))

(define rust-term-0.7.0
  (crate-source "term" "0.7.0"
                "07xzxmg7dbhlirpyfq09v7cfb9gxn0077sqqvszgjvyrjnngi7f5"))

(define rust-termcolor-1.4.1
  (crate-source "termcolor" "1.4.1"
                "0mappjh3fj3p2nmrg4y7qv94rchwi9mzmgmfflr8p2awdj7lyy86"))

(define rust-thiserror-1.0.69
  (crate-source "thiserror" "1.0.69"
                "0lizjay08agcr5hs9yfzzj6axs53a2rgx070a1dsi3jpkcrzbamn"))

(define rust-thiserror-2.0.17
  (crate-source "thiserror" "2.0.17"
                "1j2gixhm2c3s6g96vd0b01v0i0qz1101vfmw0032mdqj1z58fdgn"))

(define rust-thiserror-impl-1.0.69
  (crate-source "thiserror-impl" "1.0.69"
                "1h84fmn2nai41cxbhk6pqf46bxqq1b344v8yz089w1chzi76rvjg"))

(define rust-thiserror-impl-2.0.17
  (crate-source "thiserror-impl" "2.0.17"
                "04y92yjwg1a4piwk9nayzjfs07sps8c4vq9jnsfq9qvxrn75rw9z"))

(define rust-thread-local-1.1.9
  (crate-source "thread_local" "1.1.9"
                "1191jvl8d63agnq06pcnarivf63qzgpws5xa33hgc92gjjj4c0pn"))

(define rust-time-0.3.44
  (crate-source "time" "0.3.44"
                "179awlwb36zly3nmz5h9awai1h4pbf1d83g2pmvlw4v1pgixkrwi"))

(define rust-time-core-0.1.6
  (crate-source "time-core" "0.1.6"
                "0sqwhg7n47gbffyr0zhipqcnskxgcgzz1ix8wirqs2rg3my8x1j0"))

(define rust-time-macros-0.2.24
  (crate-source "time-macros" "0.2.24"
                "1wzb6hnl35856f58cx259q7ijc4c7yis0qsnydvw5n8jbw9b1krh"))

(define rust-tiny-keccak-2.0.2
  (crate-source "tiny-keccak" "2.0.2"
                "0dq2x0hjffmixgyf6xv9wgsbcxkd65ld0wrfqmagji8a829kg79c"))

(define rust-tinystr-0.8.1
  (crate-source "tinystr" "0.8.1"
                "12sc6h3hnn6x78iycm5v6wrs2xhxph0ydm43yyn7gdfw8l8nsksx"))

(define rust-tinyvec-1.10.0
  (crate-source "tinyvec" "1.10.0"
                "1yhk0qdqyiaa4v2j9h8pzax5gxgwpz4da0lcphfil6g6pk1zv9dz"))

(define rust-tinyvec-macros-0.1.1
  (crate-source "tinyvec_macros" "0.1.1"
                "081gag86208sc3y6sdkshgw3vysm5d34p431dzw0bshz66ncng0z"))

(define rust-tls-listener-0.11.0
  (crate-source "tls-listener" "0.11.0"
                "1yjv42kgrpbdcnn40h6mifqh0cm7fyzj0psl44q2pz6n2rn2ahdb"))

(define rust-token-cell-2.0.0
  (crate-source "token-cell" "2.0.0"
                "0sd2wg4r5a8a4cvr48006i8dpldkadki2v5i8rkgmiwn5rvv1iz9"))

(define rust-tokio-1.48.0
  (crate-source "tokio" "1.48.0"
                "0244qva5pksy8gam6llf7bd6wbk2vkab9lx26yyf08dix810wdpz"))

(define rust-tokio-macros-2.6.0
  (crate-source "tokio-macros" "2.6.0"
                "19czvgliginbzyhhfbmj77wazqn2y8g27y2nirfajdlm41bphh5g"))

(define rust-tokio-postgres-0.7.15
  (crate-source "tokio-postgres" "0.7.15"
                "17kc1zr0j7dsqvkb1lxvvn77w92qiqv0jd0p52v09zickdnxch1b"))

(define rust-tokio-rustls-0.24.1
  (crate-source "tokio-rustls" "0.24.1"
                "10bhibg57mqir7xjhb2xmf24xgfpx6fzpyw720a4ih8a737jg0y2"))

(define rust-tokio-rustls-0.26.4
  (crate-source "tokio-rustls" "0.26.4"
                "0qggwknz9w4bbsv1z158hlnpkm97j3w8v31586jipn99byaala8p"))

(define rust-tokio-stream-0.1.17
  (crate-source "tokio-stream" "0.1.17"
                "0ix0770hfp4x5rh5bl7vsnr3d4iz4ms43i522xw70xaap9xqv9gc"))

(define rust-tokio-tungstenite-0.28.0
  (crate-source "tokio-tungstenite" "0.28.0"
                "0mzqgc94csy5ai6kx5yxj548shppq2kwdbyrsdsilhycvmn40nnj"))

(define rust-tokio-util-0.7.16
  (crate-source "tokio-util" "0.7.16"
                "1r9wdrg1k5hna3m0kc8kcb8jdb6n52g7vnw93kw2xxw4cyc7qc0l"))

(define rust-tokio-websockets-0.10.1
  (crate-source "tokio-websockets" "0.10.1"
                "0pb072rbyqa8ba4a4bmdc1if1rvr3hkkij8n9p88s0xk7026d4gm"))

(define rust-toml-datetime-0.7.3
  (crate-source "toml_datetime" "0.7.3"
                "0cs5f8y4rdsmmwipjclmq97lrwppjy2qa3vja4f9d5xwxcwvdkgj"))

(define rust-toml-edit-0.23.7
  (crate-source "toml_edit" "0.23.7"
                "13cgp4y6prad1lh18bbg64zkq48hafq7xzs4fb0hwpcv1mnyz1b4"))

(define rust-toml-parser-1.0.4
  (crate-source "toml_parser" "1.0.4"
                "03l0750d1cyliij9vac4afpp1syh1a6yhbbalnslpnsvsdlf5jy0"))

(define rust-tonic-0.12.3
  (crate-source "tonic" "0.12.3"
                "0ljd1lfjpw0vrm5wbv15x6nq2i38llsanls5rkzmdn2n0wrmnz47"))

(define rust-totp-rs-5.7.0
  (crate-source "totp-rs" "5.7.0"
                "0wmz0ri3d9ml04wrd5qk5a6xq70g8zlzc2g9k61gi3pm10hka97i"))

(define rust-tower-0.4.13
  (crate-source "tower" "0.4.13"
                "073wncyqav4sak1p755hf6vl66njgfc1z1g1di9rxx3cvvh9pymq"))

(define rust-tower-0.5.2
  (crate-source "tower" "0.5.2"
                "1ybmd59nm4abl9bsvy6rx31m4zvzp5rja2slzpn712y9b68ssffh"))

(define rust-tower-http-0.6.6
  (crate-source "tower-http" "0.6.6"
                "1wh51y4rf03f91c6rvli6nwzsarx7097yx6sqlm75ag27pbjzj5d"))

(define rust-tower-layer-0.3.3
  (crate-source "tower-layer" "0.3.3"
                "03kq92fdzxin51w8iqix06dcfgydyvx7yr6izjq0p626v9n2l70j"))

(define rust-tower-service-0.3.3
  (crate-source "tower-service" "0.3.3"
                "1hzfkvkci33ra94xjx64vv3pp0sq346w06fpkcdwjcid7zhvdycd"))

(define rust-tracing-0.1.41
  (crate-source "tracing" "0.1.41"
                "1l5xrzyjfyayrwhvhldfnwdyligi1mpqm8mzbi2m1d6y6p2hlkkq"))

(define rust-tracing-attributes-0.1.30
  (crate-source "tracing-attributes" "0.1.30"
                "00v9bhfgfg3v101nmmy7s3vdwadb7ngc8c1iw6wai9vj9sv3lf41"))

(define rust-tracing-core-0.1.34
  (crate-source "tracing-core" "0.1.34"
                "0y3nc4mpnr79rzkrcylv5f5bnjjp19lsxwis9l4kzs97ya0jbldr"))

(define rust-tracing-log-0.2.0
  (crate-source "tracing-log" "0.2.0"
                "1hs77z026k730ij1a9dhahzrl0s073gfa2hm5p0fbl0b80gmz1gf"))

(define rust-tracing-serde-0.2.0
  (crate-source "tracing-serde" "0.2.0"
                "1wbgzi364vzfswfkvy48a3p0z5xmv98sx342r57sil70ggmiljvh"))

(define rust-tracing-subscriber-0.3.20
  (crate-source "tracing-subscriber" "0.3.20"
                "1m9447bxq7236avgl6n5yb2aqwplrghm61dgipw03mh7ad7s2m10"))

(define rust-try-lock-0.2.5
  (crate-source "try-lock" "0.2.5"
                "0jqijrrvm1pyq34zn1jmy2vihd4jcrjlvsh4alkjahhssjnsn8g4"))

(define rust-try-map-0.3.1
  (crate-source "try_map" "0.3.1"
                "106mz6cxmgf5m34ww6h45g0ags2j92zc153xy4nbphdmgk82c5pv"))

(define rust-tryhard-0.5.2
  (crate-source "tryhard" "0.5.2"
                "1rdl4cn7rrj2pkp596paagqixj5p0hm4v8gqw07nx5yxbsyqxrcz"))

(define rust-tungstenite-0.28.0
  (crate-source "tungstenite" "0.28.0"
                "0hll4l62lk77zqzgps04689skpk555lcpmi3hhyyn2as9v4dqa46"))

(define rust-twofish-0.7.1
  (crate-source "twofish" "0.7.1"
                "04w0ii2c0c9ws08aw6c7illh9zql22il9lbwjk1mgir30aiq73m7"))

(define rust-twox-hash-2.1.2
  (crate-source "twox-hash" "2.1.2"
                "1721278f1yc5zvkpdb8gsb1x6nlfjdmwm5fk9ff3fismcxmi78wy"))

(define rust-typenum-1.19.0
  (crate-source "typenum" "1.19.0"
                "1fw2mpbn2vmqan56j1b3fbpcdg80mz26fm53fs16bq5xcq84hban"))

(define rust-typewit-1.14.2
  (crate-source "typewit" "1.14.2"
                "0wag2gf66s4qlb3x2x4v4hmhsjsph6wpq4jxsr1bif7xq1yaxhgq"))

(define rust-typewit-proc-macros-1.8.1
  (crate-source "typewit_proc_macros" "1.8.1"
                "1mlkh4mhbn4b7xg9640blk74bm5ddaa44ihvl0sljw1w5gm86sp3"))

(define rust-ucd-trie-0.1.7
  (crate-source "ucd-trie" "0.1.7"
                "0wc9p07sqwz320848i52nvyjvpsxkx3kv5bfbmm6s35809fdk5i8"))

(define rust-uhlc-0.8.2
  (crate-source "uhlc" "0.8.2"
                "0knjx6v9yhbh00xi5dj23x1ijh90ldm0i6z4mfvqav2f7rg68amn"))

(define rust-unicase-2.8.1
  (crate-source "unicase" "2.8.1"
                "0fd5ddbhpva7wrln2iah054ar2pc1drqjcll0f493vj3fv8l9f3m"))

(define rust-unicode-bidi-0.3.18
  (crate-source "unicode-bidi" "0.3.18"
                "1xcxwbsqa24b8vfchhzyyzgj0l6bn51ib5v8j6krha0m77dva72w"))

(define rust-unicode-ident-1.0.20
  (crate-source "unicode-ident" "1.0.20"
                "01lafj17xwizrlvn006zz8ip99hqisf77kjk0a8flfmpmrsynbj6"))

(define rust-unicode-normalization-0.1.24
  (crate-source "unicode-normalization" "0.1.24"
                "0mnrk809z3ix1wspcqy97ld5wxdb31f3xz6nsvg5qcv289ycjcsh"))

(define rust-unicode-properties-0.1.3
  (crate-source "unicode-properties" "0.1.3"
                "1l3mbgzwz8g14xcs09p4ww3hjkjcf0i1ih13nsg72bhj8n5jl3z7"))

(define rust-unicode-script-0.5.7
  (crate-source "unicode-script" "0.5.7"
                "07vwr9iddw5xwrj57hc6ig0mwmlzjdajj9lyfxqz9by9a2rj3d4z"))

(define rust-unicode-security-0.1.2
  (crate-source "unicode-security" "0.1.2"
                "0l2yidnwc7g791pyqz44p3jg9msmf5miclhwnvc5xlsxafhxnk9f"))

(define rust-unicode-width-0.1.14
  (crate-source "unicode-width" "0.1.14"
                "1bzn2zv0gp8xxbxbhifw778a7fc93pa6a1kj24jgg9msj07f7mkx"))

(define rust-unicode-width-0.2.2
  (crate-source "unicode-width" "0.2.2"
                "0m7jjzlcccw716dy9423xxh0clys8pfpllc5smvfxrzdf66h9b5l"))

(define rust-unicode-xid-0.2.6
  (crate-source "unicode-xid" "0.2.6"
                "0lzqaky89fq0bcrh6jj6bhlz37scfd8c7dsj5dq7y32if56c1hgb"))

(define rust-universal-hash-0.5.1
  (crate-source "universal-hash" "0.5.1"
                "1sh79x677zkncasa95wz05b36134822w6qxmi1ck05fwi33f47gw"))

(define rust-unsafe-libyaml-0.2.11
  (crate-source "unsafe-libyaml" "0.2.11"
                "0qdq69ffl3v5pzx9kzxbghzn0fzn266i1xn70y88maybz9csqfk7"))

(define rust-untrusted-0.9.0
  (crate-source "untrusted" "0.9.0"
                "1ha7ib98vkc538x0z60gfn0fc5whqdd85mb87dvisdcaifi6vjwf"))

(define rust-unty-0.0.4
  (crate-source "unty" "0.0.4"
                "1blhyv01qiv5sb72sal3xa1l8nzck3answawxkkiw3fd2x1phjbd"))

(define rust-unzip-n-0.1.2
  (crate-source "unzip-n" "0.1.2"
                "173bi6p3vypprk0b07vpj7zcc5n5qimy3460587pyi4n0mdfiry2"))

(define rust-url-2.5.7
  (crate-source "url" "2.5.7"
                "0nzghdv0kcksyvri0npxbjzyx2ihprks5k590y77bld355m17g08"))

(define rust-urlencoding-2.1.3
  (crate-source "urlencoding" "2.1.3"
                "1nj99jp37k47n0hvaz5fvz7z6jd0sb4ppvfy3nphr1zbnyixpy6s"))

(define rust-utf-8-0.7.6
  (crate-source "utf-8" "0.7.6"
                "1a9ns3fvgird0snjkd3wbdhwd3zdpc2h5gpyybrfr6ra5pkqxk09"))

(define rust-utf8-iter-1.0.4
  (crate-source "utf8_iter" "1.0.4"
                "1gmna9flnj8dbyd8ba17zigrp9c4c3zclngf5lnb5yvz1ri41hdn"))

(define rust-utf8parse-0.2.2
  (crate-source "utf8parse" "0.2.2"
                "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6"))

(define rust-uuid-1.18.1
  (crate-source "uuid" "1.18.1"
                "18kh01qmfayn4psap52x8xdjkzw2q8bcbpnhhxjs05dr22mbi1rg"))

(define rust-validated-struct-2.2.0
  (crate-source "validated_struct" "2.2.0"
                "03p641r35wxr0yppanaqbpbvrarbv18h0qr826g36vi8lzl976l6"))

(define rust-validated-struct-macros-2.2.0
  (crate-source "validated_struct_macros" "2.2.0"
                "07kzi53p4ngq157yp744ah773jd5150pi76gnkp08yi2wyccwi4c"))

(define rust-valuable-0.1.1
  (crate-source "valuable" "0.1.1"
                "0r9srp55v7g27s5bg7a2m095fzckrcdca5maih6dy9bay6fflwxs"))

(define rust-vcpkg-0.2.15
  (crate-source "vcpkg" "0.2.15"
                "09i4nf5y8lig6xgj3f7fyrvzd3nlaw4znrihw8psidvv5yk4xkdc"))

(define rust-vec-map-0.8.2
  (crate-source "vec_map" "0.8.2"
                "1481w9g1dw9rxp3l6snkdqihzyrd2f8vispzqmwjwsdyhw8xzggi"))

(define rust-version-check-0.9.5
  (crate-source "version_check" "0.9.5"
                "0nhhi4i5x89gm911azqbn7avs9mdacw2i3vcz3cnmz3mv4rqz4hb"))

(define rust-virtue-0.0.18
  (crate-source "virtue" "0.0.18"
                "1cgp79pzzs117kjlc3jnnkixbyaqri12j40mx2an41qhrymv27h5"))

(define rust-void-1.0.2
  (crate-source "void" "1.0.2"
                "0zc8f0ksxvmhvgx4fdg0zyn6vdnbxd2xv9hfx4nhzg6kbs4f80ka"))

(define rust-waker-fn-1.2.0
  (crate-source "waker-fn" "1.2.0"
                "1dvk0qsv88kiq22x8w0qz0k9nyrxxm5a9a9czdwdvvhcvjh12wii"))

(define rust-walkdir-2.5.0
  (crate-source "walkdir" "2.5.0"
                "0jsy7a710qv8gld5957ybrnc07gavppp963gs32xk4ag8130jy99"))

(define rust-want-0.3.1
  (crate-source "want" "0.3.1"
                "03hbfrnvqqdchb5kgxyavb9jabwza0dmh2vw5kg0dq8rxl57d9xz"))

(define rust-wasi-0.11.1+wasi-snapshot-preview1
  (crate-source "wasi" "0.11.1+wasi-snapshot-preview1"
                "0jx49r7nbkbhyfrfyhz0bm4817yrnxgd3jiwwwfv0zl439jyrwyc"))

(define rust-wasi-0.9.0+wasi-snapshot-preview1
  (crate-source "wasi" "0.9.0+wasi-snapshot-preview1"
                "06g5v3vrdapfzvfq662cij7v8a1flwr2my45nnncdv2galrdzkfc"))

(define rust-wasip2-1.0.1+wasi-0.2.4
  (crate-source "wasip2" "1.0.1+wasi-0.2.4"
                "1rsqmpspwy0zja82xx7kbkbg9fv34a4a2if3sbd76dy64a244qh5"))

(define rust-wasite-0.1.0
  (crate-source "wasite" "0.1.0"
                "0nw5h9nmcl4fyf4j5d4mfdjfgvwi1cakpi349wc4zrr59wxxinmq"))

(define rust-wasm-bindgen-0.2.104
  (crate-source "wasm-bindgen" "0.2.104"
                "0b8f4l6pqm0bz0lj5xgwmchb6977n71vmh7srd0axwg93b011nn1"))

(define rust-wasm-bindgen-backend-0.2.104
  (crate-source "wasm-bindgen-backend" "0.2.104"
                "069vnhhn2j4w2gwd8rch6g8d3iwkrgi45fas6i3qm7glcrd9l737"))

(define rust-wasm-bindgen-futures-0.4.54
  (crate-source "wasm-bindgen-futures" "0.4.54"
                "0p5c10vfd7p7c607x3cgyfw9h77z1k33d6zzw2x77k3qwi0qs0vy"))

(define rust-wasm-bindgen-macro-0.2.104
  (crate-source "wasm-bindgen-macro" "0.2.104"
                "06d1m5bg272h6jabq0snm7c50fifjz6r20f5hqlmz7y5wivh99kw"))

(define rust-wasm-bindgen-macro-support-0.2.104
  (crate-source "wasm-bindgen-macro-support" "0.2.104"
                "1mr18kx7ima1pmsqlkk982q4a0vf3r8s1x6901jb59sd1prd41wz"))

(define rust-wasm-bindgen-shared-0.2.104
  (crate-source "wasm-bindgen-shared" "0.2.104"
                "1la1xj9v3gmawnlyi7lc3mb3xi447r6frb98hi2fb9m1nb47vmms"))

(define rust-wasm-streams-0.4.2
  (crate-source "wasm-streams" "0.4.2"
                "0rddn007hp6k2cm91mm9y33n79b0jxv0c3znzszcvv67hn6ks18m"))

(define rust-web-sys-0.3.81
  ;; TODO: Check bundled sources.
  (crate-source "web-sys" "0.3.81"
                "0871ifd79ni9813sp5amk7wb3avznkijlsly2ap4r9r4m4bw8rwk"))

(define rust-web-time-1.1.0
  (crate-source "web-time" "1.1.0"
                "1fx05yqx83dhx628wb70fyy10yjfq1jpl20qfqhdkymi13rq0ras"))

(define rust-webpki-root-certs-1.0.3
  (crate-source "webpki-root-certs" "1.0.3"
                "0vkqczsmad6rr1rc5qnr36f6jqblz9p1xrvv5rv4ps0d93n53mh5"))

(define rust-webpki-roots-0.25.4
  (crate-source "webpki-roots" "0.25.4"
                "1qgqa615gc1cgklls4bkjp9jv9pvv3jnl82lc6wd7dkximywa82z"))

(define rust-webpki-roots-0.26.11
  (crate-source "webpki-roots" "0.26.11"
                "1agpayg5zzf7m1a01q30jahlgmn5nwggbabdhq0in008pf5c66sj"))

(define rust-webpki-roots-1.0.3
  (crate-source "webpki-roots" "1.0.3"
                "1f49w0s7f3fgczvjri179wh2a9g8jpkmdi5bi5l8p7ylsb031c9j"))

(define rust-whatlang-0.18.0
  (crate-source "whatlang" "0.18.0"
                "01y152vj3qly91wqqm2q6vj2355940slfhjkfndkaakfb65z7s7m"))

(define rust-whoami-1.6.1
  (crate-source "whoami" "1.6.1"
                "0zg9sz669vhqyxysn4lymnianj29jxs2vl6k2lqcl0kp0yslsjjx"))

(define rust-widestring-1.2.1
  (crate-source "widestring" "1.2.1"
                "0wg4qdbs70xqnlbm8wb0bs4idm2mxk3b6kaqwllsncmb2cqrq1kj"))

(define rust-winapi-0.3.9
  (crate-source "winapi" "0.3.9"
                "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw"))

(define rust-winapi-i686-pc-windows-gnu-0.4.0
  (crate-source "winapi-i686-pc-windows-gnu" "0.4.0"
                "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))

(define rust-winapi-util-0.1.11
  (crate-source "winapi-util" "0.1.11"
                "08hdl7mkll7pz8whg869h58c1r9y7in0w0pk8fm24qc77k0b39y2"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-windows-aarch64-gnullvm-0.42.2
  (crate-source "windows_aarch64_gnullvm" "0.42.2"
                "1y4q0qmvl0lvp7syxvfykafvmwal5hrjb4fmv04bqs0bawc52yjr"))

(define rust-windows-aarch64-gnullvm-0.48.5
  (crate-source "windows_aarch64_gnullvm" "0.48.5"
                "1n05v7qblg1ci3i567inc7xrkmywczxrs1z3lj3rkkxw18py6f1b"))

(define rust-windows-aarch64-gnullvm-0.52.6
  (crate-source "windows_aarch64_gnullvm" "0.52.6"
                "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))

(define rust-windows-aarch64-gnullvm-0.53.1
  (crate-source "windows_aarch64_gnullvm" "0.53.1"
                "0lqvdm510mka9w26vmga7hbkmrw9glzc90l4gya5qbxlm1pl3n59"))

(define rust-windows-aarch64-msvc-0.42.2
  (crate-source "windows_aarch64_msvc" "0.42.2"
                "0hsdikjl5sa1fva5qskpwlxzpc5q9l909fpl1w6yy1hglrj8i3p0"))

(define rust-windows-aarch64-msvc-0.48.5
  (crate-source "windows_aarch64_msvc" "0.48.5"
                "1g5l4ry968p73g6bg6jgyvy9lb8fyhcs54067yzxpcpkf44k2dfw"))

(define rust-windows-aarch64-msvc-0.52.6
  (crate-source "windows_aarch64_msvc" "0.52.6"
                "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))

(define rust-windows-aarch64-msvc-0.53.1
  (crate-source "windows_aarch64_msvc" "0.53.1"
                "01jh2adlwx043rji888b22whx4bm8alrk3khjpik5xn20kl85mxr"))

(define rust-windows-core-0.62.2
  (crate-source "windows-core" "0.62.2"
                "1swxpv1a8qvn3bkxv8cn663238h2jccq35ff3nsj61jdsca3ms5q"))

(define rust-windows-i686-gnu-0.42.2
  (crate-source "windows_i686_gnu" "0.42.2"
                "0kx866dfrby88lqs9v1vgmrkk1z6af9lhaghh5maj7d4imyr47f6"))

(define rust-windows-i686-gnu-0.48.5
  (crate-source "windows_i686_gnu" "0.48.5"
                "0gklnglwd9ilqx7ac3cn8hbhkraqisd0n83jxzf9837nvvkiand7"))

(define rust-windows-i686-gnu-0.52.6
  (crate-source "windows_i686_gnu" "0.52.6"
                "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))

(define rust-windows-i686-gnu-0.53.1
  (crate-source "windows_i686_gnu" "0.53.1"
                "18wkcm82ldyg4figcsidzwbg1pqd49jpm98crfz0j7nqd6h6s3ln"))

(define rust-windows-i686-gnullvm-0.52.6
  (crate-source "windows_i686_gnullvm" "0.52.6"
                "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))

(define rust-windows-i686-gnullvm-0.53.1
  (crate-source "windows_i686_gnullvm" "0.53.1"
                "030qaxqc4salz6l4immfb6sykc6gmhyir9wzn2w8mxj8038mjwzs"))

(define rust-windows-i686-msvc-0.42.2
  (crate-source "windows_i686_msvc" "0.42.2"
                "0q0h9m2aq1pygc199pa5jgc952qhcnf0zn688454i7v4xjv41n24"))

(define rust-windows-i686-msvc-0.48.5
  (crate-source "windows_i686_msvc" "0.48.5"
                "01m4rik437dl9rdf0ndnm2syh10hizvq0dajdkv2fjqcywrw4mcg"))

(define rust-windows-i686-msvc-0.52.6
  (crate-source "windows_i686_msvc" "0.52.6"
                "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))

(define rust-windows-i686-msvc-0.53.1
  (crate-source "windows_i686_msvc" "0.53.1"
                "1hi6scw3mn2pbdl30ji5i4y8vvspb9b66l98kkz350pig58wfyhy"))

(define rust-windows-implement-0.60.2
  (crate-source "windows-implement" "0.60.2"
                "1psxhmklzcf3wjs4b8qb42qb6znvc142cb5pa74rsyxm1822wgh5"))

(define rust-windows-interface-0.59.3
  (crate-source "windows-interface" "0.59.3"
                "0n73cwrn4247d0axrk7gjp08p34x1723483jxjxjdfkh4m56qc9z"))

(define rust-windows-link-0.1.3
  (crate-source "windows-link" "0.1.3"
                "12kr1p46dbhpijr4zbwr2spfgq8i8c5x55mvvfmyl96m01cx4sjy"))

(define rust-windows-link-0.2.1
  (crate-source "windows-link" "0.2.1"
                "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h"))

(define rust-windows-result-0.4.1
  (crate-source "windows-result" "0.4.1"
                "1d9yhmrmmfqh56zlj751s5wfm9a2aa7az9rd7nn5027nxa4zm0bp"))

(define rust-windows-strings-0.5.1
  (crate-source "windows-strings" "0.5.1"
                "14bhng9jqv4fyl7lqjz3az7vzh8pw0w4am49fsqgcz67d67x0dvq"))

(define rust-windows-sys-0.45.0
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.45.0"
                "1l36bcqm4g89pknfp8r9rl1w4bn017q6a8qlx8viv0xjxzjkna3m"))

(define rust-windows-sys-0.48.0
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.48.0"
                "1aan23v5gs7gya1lc46hqn9mdh8yph3fhxmhxlw36pn6pqc28zb7"))

(define rust-windows-sys-0.52.0
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.52.0"
                "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))

(define rust-windows-sys-0.59.0
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.59.0"
                "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))

(define rust-windows-sys-0.60.2
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.60.2"
                "1jrbc615ihqnhjhxplr2kw7rasrskv9wj3lr80hgfd42sbj01xgj"))

(define rust-windows-sys-0.61.2
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.61.2"
                "1z7k3y9b6b5h52kid57lvmvm05362zv1v8w0gc7xyv5xphlp44xf"))

(define rust-windows-targets-0.42.2
  (crate-source "windows-targets" "0.42.2"
                "0wfhnib2fisxlx8c507dbmh97kgij4r6kcxdi0f9nk6l1k080lcf"))

(define rust-windows-targets-0.48.5
  (crate-source "windows-targets" "0.48.5"
                "034ljxqshifs1lan89xwpcy1hp0lhdh4b5n0d2z4fwjx2piacbws"))

(define rust-windows-targets-0.52.6
  (crate-source "windows-targets" "0.52.6"
                "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))

(define rust-windows-targets-0.53.5
  (crate-source "windows-targets" "0.53.5"
                "1wv9j2gv3l6wj3gkw5j1kr6ymb5q6dfc42yvydjhv3mqa7szjia9"))

(define rust-windows-x86-64-gnu-0.42.2
  (crate-source "windows_x86_64_gnu" "0.42.2"
                "0dnbf2xnp3xrvy8v9mgs3var4zq9v9yh9kv79035rdgyp2w15scd"))

(define rust-windows-x86-64-gnu-0.48.5
  (crate-source "windows_x86_64_gnu" "0.48.5"
                "13kiqqcvz2vnyxzydjh73hwgigsdr2z1xpzx313kxll34nyhmm2k"))

(define rust-windows-x86-64-gnu-0.52.6
  (crate-source "windows_x86_64_gnu" "0.52.6"
                "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))

(define rust-windows-x86-64-gnu-0.53.1
  (crate-source "windows_x86_64_gnu" "0.53.1"
                "16d4yiysmfdlsrghndr97y57gh3kljkwhfdbcs05m1jasz6l4f4w"))

(define rust-windows-x86-64-gnullvm-0.42.2
  (crate-source "windows_x86_64_gnullvm" "0.42.2"
                "18wl9r8qbsl475j39zvawlidp1bsbinliwfymr43fibdld31pm16"))

(define rust-windows-x86-64-gnullvm-0.48.5
  (crate-source "windows_x86_64_gnullvm" "0.48.5"
                "1k24810wfbgz8k48c2yknqjmiigmql6kk3knmddkv8k8g1v54yqb"))

(define rust-windows-x86-64-gnullvm-0.52.6
  (crate-source "windows_x86_64_gnullvm" "0.52.6"
                "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))

(define rust-windows-x86-64-gnullvm-0.53.1
  (crate-source "windows_x86_64_gnullvm" "0.53.1"
                "1qbspgv4g3q0vygkg8rnql5c6z3caqv38japiynyivh75ng1gyhg"))

(define rust-windows-x86-64-msvc-0.42.2
  (crate-source "windows_x86_64_msvc" "0.42.2"
                "1w5r0q0yzx827d10dpjza2ww0j8iajqhmb54s735hhaj66imvv4s"))

(define rust-windows-x86-64-msvc-0.48.5
  (crate-source "windows_x86_64_msvc" "0.48.5"
                "0f4mdp895kkjh9zv8dxvn4pc10xr7839lf5pa9l0193i2pkgr57d"))

(define rust-windows-x86-64-msvc-0.52.6
  (crate-source "windows_x86_64_msvc" "0.52.6"
                "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))

(define rust-windows-x86-64-msvc-0.53.1
  (crate-source "windows_x86_64_msvc" "0.53.1"
                "0l6npq76vlq4ksn4bwsncpr8508mk0gmznm6wnhjg95d19gzzfyn"))

(define rust-winnow-0.7.13
  (crate-source "winnow" "0.7.13"
                "1krrjc1wj2vx0r57m9nwnlc1zrhga3fq41d8w9hysvvqb5mj7811"))

(define rust-winreg-0.50.0
  (crate-source "winreg" "0.50.0"
                "1cddmp929k882mdh6i9f2as848f13qqna6czwsqzkh1pqnr5fkjj"))

(define rust-wit-bindgen-0.46.0
  (crate-source "wit-bindgen" "0.46.0"
                "0ngysw50gp2wrrfxbwgp6dhw1g6sckknsn3wm7l00vaf7n48aypi"))

(define rust-writeable-0.6.1
  (crate-source "writeable" "0.6.1"
                "1fx29zncvbrqzgz7li88vzdm8zvgwgwy2r9bnjqxya09pfwi0bza"))

(define rust-wyz-0.5.1
  (crate-source "wyz" "0.5.1"
                "1vdrfy7i2bznnzjdl9vvrzljvs4s3qm8bnlgqwln6a941gy61wq5"))

(define rust-x25519-dalek-2.0.1
  (crate-source "x25519-dalek" "2.0.1"
                "0xyjgqpsa0q6pprakdp58q1hy45rf8wnqqscgzx0gyw13hr6ir67"))

(define rust-x509-parser-0.18.0
  (crate-source "x509-parser" "0.18.0"
                "09b45c4bxl9i2lgxbc64lqqk7qrw02ghgllqd09nanhi21ri6gpb"))

(define rust-xml-rs-0.8.27
  (crate-source "xml-rs" "0.8.27"
                "1irplg223x6w3lvj0yig6czbiwci06495wc9xg3660kh6cvl1n3g"))

(define rust-xxhash-rust-0.8.15
  (crate-source "xxhash-rust" "0.8.15"
                "1lrmffpn45d967afw7f1p300rsx7ill66irrskxpcm1p41a0rlpx"))

(define rust-yasna-0.5.2
  (crate-source "yasna" "0.5.2"
                "1ka4ixrplnrfqyl1kymdj8cwpdp2k0kdr73b57hilcn1kiab6yz1"))

(define rust-yoke-0.8.0
  (crate-source "yoke" "0.8.0"
                "1k4mfr48vgi7wh066y11b7v1ilakghlnlhw9snzz8vi2p00vnhaz"))

(define rust-yoke-derive-0.8.0
  (crate-source "yoke-derive" "0.8.0"
                "1dha5jrjz9jaq8kmxq1aag86b98zbnm9lyjrihy5sv716sbkrniq"))

(define rust-zenoh-1.6.2
  (crate-source "zenoh" "1.6.2"
                "0zrl1jiys39qxhs9cf86sv8i0lhvx3fgk9f89xp4p78njl3h9py5"))

(define rust-zenoh-buffers-1.6.2
  (crate-source "zenoh-buffers" "1.6.2"
                "1i7ciah2zwafhhziqy8yz8x2j4js6mvc3bkykcwkyy83gf4j22ai"))

(define rust-zenoh-codec-1.6.2
  (crate-source "zenoh-codec" "1.6.2"
                "181vlw0nf7x54dn7asipjbydrq2v2ynm5axgxrm750d7yzppfnjq"))

(define rust-zenoh-collections-1.6.2
  (crate-source "zenoh-collections" "1.6.2"
                "11w8wbn7j51nz4wcpy5n4vl28rbs1cwkg6prmf7a3ar1ygnaf5zs"))

(define rust-zenoh-config-1.6.2
  (crate-source "zenoh-config" "1.6.2"
                "15cj3gryf9z65varshsnccxdq7wnzl8aqp856w2b3l6qizph2a60"))

(define rust-zenoh-core-1.6.2
  (crate-source "zenoh-core" "1.6.2"
                "1n8w8mkz1n3ynhgc826lszcic3177svjl75ma60g8x0gkp84amij"))

(define rust-zenoh-crypto-1.6.2
  (crate-source "zenoh-crypto" "1.6.2"
                "0bvcgcv27dzjjdkf4c4jhgi2bj3cwwapy5x6rd4j272gb4axci2j"))

(define rust-zenoh-keyexpr-1.6.2
  (crate-source "zenoh-keyexpr" "1.6.2"
                "1rzy799w573i3cha8hj76mq46cxpgw57crdl89sghcakm065qjf9"))

(define rust-zenoh-link-1.6.2
  (crate-source "zenoh-link" "1.6.2"
                "0fsjwcz15sjl7vz3iwgpaqzy9x6x7sw7ly5fciisw1iba83py6h0"))

(define rust-zenoh-link-commons-1.6.2
  (crate-source "zenoh-link-commons" "1.6.2"
                "08pnj72cx6pbglabc3baysbf58ya5khm6hny4hhgp6kqkd4mpq2v"))

(define rust-zenoh-link-quic-1.6.2
  (crate-source "zenoh-link-quic" "1.6.2"
                "1am4khp31f6c1wa0my44hv2gmyf7wznhbl9lm0xk2p80nx5h6s21"))

(define rust-zenoh-link-tcp-1.6.2
  (crate-source "zenoh-link-tcp" "1.6.2"
                "0ianknhwbga8v73r76f338spz85fr6rhg75n1xv508v80qsqv5iv"))

(define rust-zenoh-link-tls-1.6.2
  (crate-source "zenoh-link-tls" "1.6.2"
                "0vsr3nx44kf02adjzmh714py5cizl3qxrshkaz3w87018jxa8458"))

(define rust-zenoh-link-udp-1.6.2
  (crate-source "zenoh-link-udp" "1.6.2"
                "0r93dbgv9lb0pj4zb1r0nan9q6bp2fvww1izvg8b84y61ja8n5x4"))

(define rust-zenoh-macros-1.6.2
  (crate-source "zenoh-macros" "1.6.2"
                "1jhahhkafpcfirimgij2c955l84pziwgnmm9yva0xqc7yrzg3grb"))

(define rust-zenoh-plugin-trait-1.6.2
  (crate-source "zenoh-plugin-trait" "1.6.2"
                "0wkim6a82953ymdpi926mxlsh924k5lb6ly534gvxic5nnq731cn"))

(define rust-zenoh-protocol-1.6.2
  (crate-source "zenoh-protocol" "1.6.2"
                "073jgy85y93szcgk2lsh9319n4kkpw2r1gr4z3sm87w3a7pnd6l7"))

(define rust-zenoh-result-1.6.2
  (crate-source "zenoh-result" "1.6.2"
                "1gcl5zk69i29l5xy3dqgcriv5l5ipa4nsrd4906ksi2f6b9n9xg0"))

(define rust-zenoh-runtime-1.6.2
  (crate-source "zenoh-runtime" "1.6.2"
                "1kwd6h8lz5bzcvgvcmmck47jpkdy3msk51ai8sqswsfl7zqwx9g3"))

(define rust-zenoh-sync-1.6.2
  (crate-source "zenoh-sync" "1.6.2"
                "1qvh6a6576kizzkx3y2yijnjjl8vykfdqy57j1cwxdqza4ik38h4"))

(define rust-zenoh-task-1.6.2
  (crate-source "zenoh-task" "1.6.2"
                "0hafh73hd9g81mc1z5gkgxkc5zjsk7vmf2ggl8ihn509hihrgnca"))

(define rust-zenoh-transport-1.6.2
  (crate-source "zenoh-transport" "1.6.2"
                "0d0zc359kzxdhgnwf3siw4236x06lnchgz2n24b96q2mrlhlbg9a"))

(define rust-zenoh-util-1.6.2
  (crate-source "zenoh-util" "1.6.2"
                "178aick8x19yk5h96zwdy2ahzr6cgh353haqyag5r4yhkqakd9s2"))

(define rust-zerocopy-0.8.27
  (crate-source "zerocopy" "0.8.27"
                "0b1870gf2zzlckca69v2k4mqwmf8yh2li37qldnzvvd3by58g508"))

(define rust-zerocopy-derive-0.8.27
  (crate-source "zerocopy-derive" "0.8.27"
                "0c9qrylm2p55dvaplxsl24ma48add9qk4y0d6kjbkllaqvcvill8"))

(define rust-zerofrom-0.1.6
  (crate-source "zerofrom" "0.1.6"
                "19dyky67zkjichsb7ykhv0aqws3q0jfvzww76l66c19y6gh45k2h"))

(define rust-zerofrom-derive-0.1.6
  (crate-source "zerofrom-derive" "0.1.6"
                "00l5niw7c1b0lf1vhvajpjmcnbdp2vn96jg4nmkhq2db0rp5s7np"))

(define rust-zeroize-1.8.2
  (crate-source "zeroize" "1.8.2"
                "1l48zxgcv34d7kjskr610zqsm6j2b4fcr2vfh9jm9j1jgvk58wdr"))

(define rust-zeroize-derive-1.4.2
  (crate-source "zeroize_derive" "1.4.2"
                "0sczjlqjdmrp3wn62g7mw6p438c9j4jgp2f9zamd56991mdycdnf"))

(define rust-zerotrie-0.2.2
  (crate-source "zerotrie" "0.2.2"
                "15gmka7vw5k0d24s0vxgymr2j6zn2iwl12wpmpnpjgsqg3abpw1n"))

(define rust-zerovec-0.11.4
  (crate-source "zerovec" "0.11.4"
                "0fz7j1ns8d86m2fqg2a4bzi5gnh5892bxv4kcr9apwc6a3ajpap7"))

(define rust-zerovec-derive-0.11.1
  (crate-source "zerovec-derive" "0.11.1"
                "13zms8hj7vzpfswypwggyfr4ckmyc7v3di49pmj8r1qcz9z275jv"))

(define rust-zip-5.1.1
  (crate-source "zip" "5.1.1"
                "0cp5harkdd171wmlwvaclwq9gh31lqh6b9nwdz8d9j0s2l2jk19g"))

(define rust-zip-6.0.0
  (crate-source "zip" "6.0.0"
                "12qn4kxpvgqs07z5hfzpj1cp1njczgvwjxl5n04nrpkgqg3haapb"))

(define rust-zlib-rs-0.5.2
  (crate-source "zlib-rs" "0.5.2"
                "1wh0brb3cci6ifdwwz6xasznlrgb8pr99l1z8i15qpigyj9aw1ig"))

(define rust-zopfli-0.8.2
  (crate-source "zopfli" "0.8.2"
                "1mqc2np2l47l9r1qkdm41ykgsp6m096z3ipchi4ws17m0pj5xz7d"))

(define rust-zstd-0.13.3
  (crate-source "zstd" "0.13.3"
                "12n0h4w9l526li7jl972rxpyf012jw3nwmji2qbjghv9ll8y67p9"))

(define rust-zstd-safe-7.2.4
  (crate-source "zstd-safe" "7.2.4"
                "179vxmkzhpz6cq6mfzvgwc99bpgllkr6lwxq7ylh5dmby3aw8jcg"))

(define rust-zstd-sys-2.0.16+zstd.1.5.7
  ;; TODO: Check bundled sources.
  (crate-source "zstd-sys" "2.0.16+zstd.1.5.7"
                "0j1pd2iaqpvaxlgqmmijj68wma7xwdv9grrr63j873yw5ay9xqci"))

(define-cargo-inputs lookup-cargo-inputs
                     (stalwart =>
                               (list rust-rustyxml-0.3.0
                                rust-addr2line-0.25.1
                                rust-adler2-2.0.1
                                rust-adler32-1.2.0
                                rust-aead-0.5.2
                                rust-aes-0.8.4
                                rust-aes-gcm-0.10.3
                                rust-aes-gcm-siv-0.11.1
                                rust-ahash-0.8.12
                                rust-aho-corasick-1.1.3
                                rust-allocator-api2-0.2.21
                                rust-android-system-properties-0.1.5
                                rust-anstream-0.6.21
                                rust-anstyle-1.0.13
                                rust-anstyle-parse-0.2.7
                                rust-anstyle-query-1.1.4
                                rust-anstyle-wincon-3.0.10
                                rust-anyhow-1.0.100
                                rust-arbitrary-1.4.2
                                rust-arc-swap-1.7.1
                                rust-argon2-0.5.3
                                rust-array-init-2.1.0
                                rust-arrayref-0.3.9
                                rust-arrayvec-0.7.6
                                rust-ascii-canvas-3.0.0
                                rust-asn1-rs-0.7.1
                                rust-asn1-rs-derive-0.6.0
                                rust-asn1-rs-impl-0.2.0
                                rust-async-channel-1.9.0
                                rust-async-compression-0.4.32
                                rust-async-lock-3.4.1
                                rust-async-nats-0.44.2
                                rust-async-recursion-1.1.1
                                rust-async-stream-0.3.6
                                rust-async-stream-impl-0.3.6
                                rust-async-trait-0.1.89
                                rust-atomic-waker-1.1.2
                                rust-attohttpc-0.28.5
                                rust-autocfg-1.5.0
                                rust-aws-creds-0.37.0
                                rust-aws-region-0.25.5
                                rust-azure-core-0.21.0
                                rust-azure-storage-0.21.0
                                rust-azure-storage-blobs-0.21.0
                                rust-azure-svc-blobstorage-0.21.0
                                rust-backtrace-0.3.76
                                rust-base16ct-0.2.0
                                rust-base32-0.5.1
                                rust-base64-0.11.0
                                rust-base64-0.13.1
                                rust-base64-0.21.7
                                rust-base64-0.22.1
                                rust-base64ct-1.8.0
                                rust-bincode-1.3.3
                                rust-bincode-2.0.1
                                rust-bincode-derive-2.0.1
                                rust-bindgen-0.70.1
                                rust-bindgen-0.72.1
                                rust-biscuit-0.7.0
                                rust-bit-set-0.5.3
                                rust-bit-set-0.8.0
                                rust-bit-vec-0.6.3
                                rust-bit-vec-0.8.0
                                rust-bitflags-1.3.2
                                rust-bitflags-2.10.0
                                rust-bitpacking-0.9.2
                                rust-bitvec-1.0.1
                                rust-bitvec-nom2-0.2.1
                                rust-blake2-0.10.6
                                rust-blake3-1.8.2
                                rust-block-buffer-0.9.0
                                rust-block-buffer-0.10.4
                                rust-block-padding-0.3.3
                                rust-blowfish-0.7.0
                                rust-blowfish-0.9.1
                                rust-btoi-0.4.3
                                rust-buffered-reader-1.4.0
                                rust-bumpalo-3.19.0
                                rust-bytecheck-0.8.2
                                rust-bytecheck-derive-0.8.2
                                rust-bytemuck-1.24.0
                                rust-byteorder-1.5.0
                                rust-bytes-1.10.1
                                rust-bzip2-0.6.1
                                rust-bzip2-sys-0.1.13+1.0.8
                                rust-calcard-0.1.3
                                rust-calcard-0.3.1
                                rust-camellia-0.1.0
                                rust-cast5-0.11.1
                                rust-castaway-0.2.4
                                rust-cbc-0.1.2
                                rust-cc-1.2.41
                                rust-cedarwood-0.4.6
                                rust-cesu8-1.1.0
                                rust-cexpr-0.6.0
                                rust-cfb-0.7.3
                                rust-cfb-mode-0.8.2
                                rust-cfg-if-1.0.4
                                rust-cfg-aliases-0.2.1
                                rust-chrono-0.4.42
                                rust-chrono-tz-0.10.4
                                rust-cipher-0.2.5
                                rust-cipher-0.4.4
                                rust-clang-sys-1.8.1
                                rust-clap-4.5.50
                                rust-clap-builder-4.5.50
                                rust-clap-derive-4.5.49
                                rust-clap-lex-0.7.6
                                rust-cmac-0.7.2
                                rust-cmake-0.1.54
                                rust-colorchoice-1.0.4
                                rust-combine-4.6.7
                                rust-compact-str-0.9.0
                                rust-compression-codecs-0.4.31
                                rust-compression-core-0.4.29
                                rust-concurrent-queue-2.5.0
                                rust-console-0.15.11
                                rust-const-oid-0.9.6
                                rust-const-random-0.1.18
                                rust-const-random-macro-0.1.16
                                rust-const-format-0.2.35
                                rust-const-format-proc-macros-0.2.34
                                rust-const-panic-0.2.15
                                rust-constant-time-eq-0.3.1
                                rust-core-foundation-0.9.4
                                rust-core-foundation-0.10.1
                                rust-core-foundation-sys-0.8.7
                                rust-core2-0.4.0
                                rust-cpufeatures-0.2.17
                                rust-crc-3.3.0
                                rust-crc-catalog-2.4.0
                                rust-crc16-0.4.0
                                rust-crc32fast-1.5.0
                                rust-critical-section-1.2.0
                                rust-crossbeam-0.8.4
                                rust-crossbeam-channel-0.5.15
                                rust-crossbeam-deque-0.8.6
                                rust-crossbeam-epoch-0.9.18
                                rust-crossbeam-queue-0.3.12
                                rust-crossbeam-utils-0.8.21
                                rust-crunchy-0.2.4
                                rust-crypto-bigint-0.5.5
                                rust-crypto-common-0.1.6
                                rust-crypto-mac-0.10.0
                                rust-csv-1.4.0
                                rust-csv-core-0.1.13
                                rust-ctr-0.9.2
                                rust-curve25519-dalek-4.1.3
                                rust-curve25519-dalek-derive-0.1.1
                                rust-darling-0.13.4
                                rust-darling-0.20.11
                                rust-darling-0.21.3
                                rust-darling-core-0.13.4
                                rust-darling-core-0.20.11
                                rust-darling-core-0.21.3
                                rust-darling-macro-0.13.4
                                rust-darling-macro-0.20.11
                                rust-darling-macro-0.21.3
                                rust-dary-heap-0.3.8
                                rust-data-encoding-2.9.0
                                rust-dbl-0.3.2
                                rust-deadpool-0.10.0
                                rust-deadpool-0.12.3
                                rust-deadpool-postgres-0.14.1
                                rust-deadpool-runtime-0.1.4
                                rust-decancer-3.3.3
                                rust-deflate64-0.1.10
                                rust-der-0.7.10
                                rust-der-parser-10.0.0
                                rust-deranged-0.5.4
                                rust-derive-arbitrary-1.4.2
                                rust-des-0.8.1
                                rust-digest-0.9.0
                                rust-digest-0.10.7
                                rust-dirs-6.0.0
                                rust-dirs-next-2.0.0
                                rust-dirs-sys-0.5.0
                                rust-dirs-sys-next-0.1.2
                                rust-displaydoc-0.2.5
                                rust-dlv-list-0.5.2
                                rust-dns-update-0.1.5
                                rust-doc-comment-0.3.3
                                rust-dsa-0.6.3
                                rust-dyn-clone-1.0.20
                                rust-eax-0.5.0
                                rust-ecb-0.1.2
                                rust-ecdsa-0.16.9
                                rust-ece-2.3.1
                                rust-ed25519-2.2.3
                                rust-ed25519-dalek-2.2.0
                                rust-either-1.15.0
                                rust-elasticsearch-8.5.0-alpha.1
                                rust-elliptic-curve-0.13.8
                                rust-ena-0.14.3
                                rust-encode-unicode-1.0.0
                                rust-encoding-rs-0.8.35
                                rust-endian-type-0.1.2
                                rust-endian-type-0.2.0
                                rust-enum-as-inner-0.6.1
                                rust-equivalent-1.0.2
                                rust-errno-0.3.14
                                rust-event-listener-2.5.3
                                rust-event-listener-5.4.1
                                rust-event-listener-strategy-0.5.4
                                rust-fallible-iterator-0.2.0
                                rust-fallible-iterator-0.3.0
                                rust-fallible-streaming-iterator-0.1.9
                                rust-fancy-regex-0.14.0
                                rust-farmhash-1.1.5
                                rust-fast-float-0.2.0
                                rust-fastbloom-0.14.0
                                rust-fastrand-1.9.0
                                rust-fastrand-2.3.0
                                rust-ff-0.13.1
                                rust-fiat-crypto-0.2.9
                                rust-find-msvc-tools-0.1.4
                                rust-fixedbitset-0.4.2
                                rust-fixedbitset-0.5.7
                                rust-flate2-1.1.4
                                rust-flume-0.11.1
                                rust-fnv-1.0.7
                                rust-foldhash-0.1.5
                                rust-foldhash-0.2.0
                                rust-foreign-types-0.3.2
                                rust-foreign-types-shared-0.1.1
                                rust-form-data-0.6.0
                                rust-form-urlencoded-1.2.2
                                rust-foundationdb-0.9.2
                                rust-foundationdb-gen-0.9.2
                                rust-foundationdb-macros-0.3.2
                                rust-foundationdb-sys-0.9.1
                                rust-foundationdb-tuple-0.9.1
                                rust-funty-2.0.0
                                rust-futures-0.3.31
                                rust-futures-channel-0.3.31
                                rust-futures-core-0.3.31
                                rust-futures-executor-0.3.31
                                rust-futures-io-0.3.31
                                rust-futures-lite-1.13.0
                                rust-futures-macro-0.3.31
                                rust-futures-sink-0.3.31
                                rust-futures-task-0.3.31
                                rust-futures-util-0.3.31
                                rust-generic-array-0.14.9
                                rust-generic-array-1.3.4
                                rust-gethostname-1.1.0
                                rust-getrandom-0.1.16
                                rust-getrandom-0.2.16
                                rust-getrandom-0.3.4
                                rust-ghash-0.5.1
                                rust-gimli-0.32.3
                                rust-git-version-0.3.9
                                rust-git-version-macro-0.3.9
                                rust-glob-0.3.3
                                rust-group-0.13.0
                                rust-h2-0.3.27
                                rust-h2-0.4.12
                                rust-hashbrown-0.12.3
                                rust-hashbrown-0.14.5
                                rust-hashbrown-0.15.5
                                rust-hashbrown-0.16.0
                                rust-hashify-0.2.7
                                rust-hashlink-0.10.0
                                rust-heck-0.4.1
                                rust-heck-0.5.0
                                rust-hermit-abi-0.5.2
                                rust-hex-0.4.3
                                rust-hickory-client-0.24.4
                                rust-hickory-proto-0.24.4
                                rust-hickory-proto-0.26.0-alpha.1
                                rust-hickory-resolver-0.26.0-alpha.1
                                rust-hkdf-0.12.4
                                rust-hmac-0.10.1
                                rust-hmac-0.12.1
                                rust-home-0.5.11
                                rust-hostname-0.4.1
                                rust-http-0.2.12
                                rust-http-1.3.1
                                rust-http-body-0.4.6
                                rust-http-body-1.0.1
                                rust-http-body-util-0.1.3
                                rust-http-types-2.12.0
                                rust-httparse-1.10.1
                                rust-httpdate-1.0.3
                                rust-human-size-0.4.3
                                rust-humantime-2.3.0
                                rust-hyper-0.14.32
                                rust-hyper-1.7.0
                                rust-hyper-rustls-0.24.2
                                rust-hyper-rustls-0.27.7
                                rust-hyper-timeout-0.5.2
                                rust-hyper-util-0.1.17
                                rust-iana-time-zone-0.1.64
                                rust-iana-time-zone-haiku-0.1.2
                                rust-icu-collections-2.0.0
                                rust-icu-locale-core-2.0.0
                                rust-icu-normalizer-2.0.0
                                rust-icu-normalizer-data-2.0.0
                                rust-icu-properties-2.0.1
                                rust-icu-properties-data-2.0.1
                                rust-icu-provider-2.0.0
                                rust-idea-0.5.1
                                rust-ident-case-1.0.1
                                rust-idna-1.1.0
                                rust-idna-adapter-1.2.1
                                rust-imagesize-0.14.0
                                rust-include-flate-0.3.1
                                rust-include-flate-codegen-0.3.1
                                rust-include-flate-compress-0.3.1
                                rust-indexmap-1.9.3
                                rust-indexmap-2.12.0
                                rust-indicatif-0.17.11
                                rust-infer-0.2.3
                                rust-infer-0.19.0
                                rust-inout-0.1.4
                                rust-instant-0.1.13
                                rust-ipconfig-0.3.2
                                rust-ipnet-2.11.0
                                rust-ipnetwork-0.20.0
                                rust-iri-string-0.7.8
                                rust-is-terminal-0.4.16
                                rust-is-terminal-polyfill-1.70.1
                                rust-itertools-0.10.5
                                rust-itertools-0.11.0
                                rust-itertools-0.13.0
                                rust-itertools-0.14.0
                                rust-itoa-1.0.15
                                rust-jemalloc-sys-0.5.4+5.3.0-patched
                                rust-jemallocator-0.5.4
                                rust-jieba-macros-0.8.1
                                rust-jieba-rs-0.8.1
                                rust-jmap-client-0.3.3
                                rust-jmap-client-0.4.0
                                rust-jmap-tools-0.1.3
                                rust-jni-0.21.1
                                rust-jni-sys-0.3.0
                                rust-jobserver-0.1.34
                                rust-js-sys-0.3.81
                                rust-json5-0.4.1
                                rust-keccak-0.1.5
                                rust-keyed-set-1.1.0
                                rust-keyed-priority-queue-0.4.2
                                rust-konst-0.3.16
                                rust-konst-kernel-0.3.15
                                rust-lalrpop-0.20.2
                                rust-lalrpop-util-0.20.2
                                rust-lazy-static-1.5.0
                                rust-lber-0.5.1
                                rust-ldap3-0.12.1
                                rust-libbz2-rs-sys-0.2.2
                                rust-libc-0.2.177
                                rust-libflate-2.1.0
                                rust-libflate-lz77-2.1.0
                                rust-libloading-0.8.9
                                rust-libm-0.2.15
                                rust-libredox-0.1.10
                                rust-librocksdb-sys-0.17.3+10.4.2
                                rust-libsqlite3-sys-0.35.0
                                rust-libz-rs-sys-0.5.2
                                rust-libz-sys-1.1.22
                                rust-linked-hash-map-0.5.6
                                rust-linux-raw-sys-0.11.0
                                rust-litemap-0.8.0
                                rust-lock-api-0.4.14
                                rust-log-0.4.28
                                rust-lru-0.14.0
                                rust-lru-cache-0.1.2
                                rust-lru-slab-0.1.2
                                rust-lz4-sys-1.11.1+lz4-1.10.0
                                rust-lz4-flex-0.11.5
                                rust-lzma-rust2-0.13.0
                                rust-mail-auth-0.7.2
                                rust-mail-builder-0.4.4
                                rust-mail-parser-0.11.1
                                rust-mail-send-0.5.2
                                rust-maplit-1.0.2
                                rust-matchers-0.2.0
                                rust-maybe-async-0.2.10
                                rust-md-5-0.9.1
                                rust-md-5-0.10.6
                                rust-md5-0.7.0
                                rust-md5-0.8.0
                                rust-memchr-2.7.6
                                rust-memory-stats-1.2.0
                                rust-memsec-0.7.0
                                rust-mime-0.3.17
                                rust-mime-guess-2.0.5
                                rust-minimal-lexical-0.2.1
                                rust-miniz-oxide-0.8.9
                                rust-mio-1.1.0
                                rust-moka-0.12.11
                                rust-munge-0.4.7
                                rust-munge-macro-0.4.7
                                rust-mysql-common-derive-0.32.1
                                rust-mysql-async-0.36.1
                                rust-mysql-common-0.35.5
                                rust-nanorand-0.7.0
                                rust-new-debug-unreachable-1.0.6
                                rust-nibble-vec-0.1.0
                                rust-nix-0.30.1
                                rust-nkeys-0.4.5
                                rust-no-std-net-0.6.0
                                rust-nohash-0.2.0
                                rust-nom-7.1.3
                                rust-nonempty-collections-0.3.1
                                rust-nu-ansi-term-0.50.3
                                rust-nuid-0.5.0
                                rust-num-bigint-0.4.6
                                rust-num-bigint-dig-0.8.4
                                rust-num-conv-0.1.0
                                rust-num-integer-0.1.46
                                rust-num-iter-0.1.45
                                rust-num-traits-0.2.19
                                rust-num-cpus-1.17.0
                                rust-num-enum-0.7.5
                                rust-num-enum-derive-0.7.5
                                rust-number-prefix-0.4.0
                                rust-object-0.37.3
                                rust-ocb3-0.1.0
                                rust-oid-registry-0.8.1
                                rust-once-cell-1.21.3
                                rust-once-cell-polyfill-1.70.1
                                rust-opaque-debug-0.3.1
                                rust-openssl-0.10.74
                                rust-openssl-macros-0.1.1
                                rust-openssl-probe-0.1.6
                                rust-openssl-sys-0.9.110
                                rust-opentelemetry-0.29.1
                                rust-opentelemetry-http-0.29.0
                                rust-opentelemetry-otlp-0.29.0
                                rust-opentelemetry-proto-0.29.0
                                rust-opentelemetry-semantic-conventions-0.29.0
                                rust-opentelemetry-sdk-0.29.0
                                rust-option-ext-0.2.0
                                rust-ordered-multimap-0.7.3
                                rust-p256-0.13.2
                                rust-p384-0.13.1
                                rust-p521-0.13.3
                                rust-parking-2.2.1
                                rust-parking-lot-0.12.5
                                rust-parking-lot-core-0.9.12
                                rust-password-hash-0.5.0
                                rust-paste-1.0.15
                                rust-pbkdf2-0.12.2
                                rust-pem-3.0.6
                                rust-pem-rfc7468-0.7.0
                                rust-percent-encoding-2.3.2
                                rust-pest-2.8.3
                                rust-pest-derive-2.8.3
                                rust-pest-generator-2.8.3
                                rust-pest-meta-2.8.3
                                rust-petgraph-0.6.5
                                rust-petgraph-0.8.3
                                rust-phf-0.12.1
                                rust-phf-0.13.1
                                rust-phf-codegen-0.13.1
                                rust-phf-generator-0.13.1
                                rust-phf-macros-0.13.1
                                rust-phf-shared-0.11.3
                                rust-phf-shared-0.12.1
                                rust-phf-shared-0.13.1
                                rust-pin-project-1.1.10
                                rust-pin-project-internal-1.1.10
                                rust-pin-project-lite-0.2.16
                                rust-pin-utils-0.1.0
                                rust-pkcs1-0.7.5
                                rust-pkcs8-0.10.2
                                rust-pkg-config-0.3.32
                                rust-pnet-base-0.35.0
                                rust-pnet-datalink-0.35.0
                                rust-pnet-sys-0.35.0
                                rust-polyval-0.6.2
                                rust-portable-atomic-1.11.1
                                rust-postgres-protocol-0.6.9
                                rust-postgres-types-0.2.11
                                rust-potential-utf-0.1.3
                                rust-powerfmt-0.2.0
                                rust-ppmd-rust-1.2.1
                                rust-ppv-lite86-0.2.21
                                rust-precomputed-hash-0.1.1
                                rust-prettyplease-0.2.37
                                rust-prettytable-rs-0.10.0
                                rust-primeorder-0.13.6
                                rust-privdrop-0.5.6
                                rust-proc-macro-crate-3.4.0
                                rust-proc-macro-error-1.0.4
                                rust-proc-macro-error-attr-1.0.4
                                rust-proc-macro-error-attr2-2.0.0
                                rust-proc-macro-error2-2.0.1
                                rust-proc-macro2-1.0.101
                                rust-prometheus-0.14.0
                                rust-prost-0.13.5
                                rust-prost-derive-0.13.5
                                rust-proxy-header-0.1.2
                                rust-psl-2.1.151
                                rust-psl-types-2.0.11
                                rust-ptr-meta-0.3.1
                                rust-ptr-meta-derive-0.3.1
                                rust-pure-rust-locales-0.8.2
                                rust-pwhash-1.0.0
                                rust-quick-xml-0.31.0
                                rust-quick-xml-0.32.0
                                rust-quick-xml-0.38.3
                                rust-quick-cache-0.6.18
                                rust-quinn-0.11.9
                                rust-quinn-proto-0.11.13
                                rust-quinn-udp-0.5.14
                                rust-quote-1.0.41
                                rust-r-efi-5.3.0
                                rust-r2d2-0.8.10
                                rust-radium-0.7.0
                                rust-radix-trie-0.2.1
                                rust-radix-trie-0.3.0
                                rust-rancor-0.1.1
                                rust-rand-0.7.3
                                rust-rand-0.8.5
                                rust-rand-0.9.2
                                rust-rand-chacha-0.2.2
                                rust-rand-chacha-0.3.1
                                rust-rand-chacha-0.9.0
                                rust-rand-core-0.5.1
                                rust-rand-core-0.6.4
                                rust-rand-core-0.9.3
                                rust-rand-hc-0.2.0
                                rust-rasn-0.10.6
                                rust-rasn-cms-0.10.6
                                rust-rasn-derive-0.10.6
                                rust-rasn-pkix-0.10.6
                                rust-rayon-1.11.0
                                rust-rayon-core-1.13.0
                                rust-rcgen-0.12.1
                                rust-rcgen-0.14.5
                                rust-rdkafka-0.38.0
                                rust-rdkafka-sys-4.9.0+2.10.0
                                rust-redis-0.32.7
                                rust-redox-syscall-0.5.18
                                rust-redox-users-0.4.6
                                rust-redox-users-0.5.2
                                rust-ref-cast-1.0.25
                                rust-ref-cast-impl-1.0.25
                                rust-regex-1.12.2
                                rust-regex-automata-0.4.13
                                rust-regex-syntax-0.8.8
                                rust-rend-0.5.3
                                rust-reqwest-0.11.27
                                rust-reqwest-0.12.24
                                rust-resolv-conf-0.7.5
                                rust-rev-lines-0.3.0
                                rust-rfc6979-0.4.0
                                rust-ring-0.17.14
                                rust-ringbuffer-spsc-0.1.15
                                rust-ripemd-0.1.3
                                rust-rkyv-0.8.12
                                rust-rkyv-derive-0.8.12
                                rust-rle-decode-fast-1.0.3
                                rust-roaring-0.11.2
                                rust-rocksdb-0.24.0
                                rust-ron-0.11.0
                                rust-rpassword-7.4.0
                                rust-rsa-0.9.8
                                rust-rtoolbox-0.0.3
                                rust-rtrb-0.3.2
                                rust-rusqlite-0.37.0
                                rust-rust-ini-0.21.3
                                rust-rust-s3-0.35.1
                                rust-rust-stemmers-1.2.0
                                rust-rustc-demangle-0.1.26
                                rust-rustc-hash-1.1.0
                                rust-rustc-hash-2.1.1
                                rust-rustc-version-0.2.3
                                rust-rustc-version-0.4.1
                                rust-rusticata-macros-4.1.0
                                rust-rustix-1.1.2
                                rust-rustls-0.21.12
                                rust-rustls-0.23.33
                                rust-rustls-native-certs-0.6.3
                                rust-rustls-native-certs-0.7.3
                                rust-rustls-native-certs-0.8.2
                                rust-rustls-pemfile-1.0.4
                                rust-rustls-pemfile-2.2.0
                                rust-rustls-pki-types-1.12.0
                                rust-rustls-platform-verifier-0.6.1
                                rust-rustls-platform-verifier-android-0.1.1
                                rust-rustls-webpki-0.101.7
                                rust-rustls-webpki-0.102.8
                                rust-rustls-webpki-0.103.7
                                rust-rustversion-1.0.22
                                rust-ryu-1.0.20
                                rust-salsa20-0.10.2
                                rust-same-file-1.0.6
                                rust-saturating-0.1.0
                                rust-scc-2.4.0
                                rust-schannel-0.1.28
                                rust-scheduled-thread-pool-0.2.7
                                rust-schemars-0.8.22
                                rust-schemars-0.9.0
                                rust-schemars-1.0.4
                                rust-schemars-derive-0.8.22
                                rust-scopeguard-1.2.0
                                rust-scrypt-0.11.0
                                rust-sct-0.7.1
                                rust-sdd-3.0.10
                                rust-sec1-0.7.3
                                rust-secrecy-0.8.0
                                rust-security-framework-2.11.1
                                rust-security-framework-3.5.1
                                rust-security-framework-sys-2.15.0
                                rust-semver-0.9.0
                                rust-semver-1.0.27
                                rust-semver-parser-0.7.0
                                rust-sequoia-openpgp-2.0.0
                                rust-serde-1.0.228
                                rust-serde-bytes-0.11.19
                                rust-serde-core-1.0.228
                                rust-serde-derive-1.0.228
                                rust-serde-derive-internals-0.29.1
                                rust-serde-json-1.0.145
                                rust-serde-nanos-0.1.4
                                rust-serde-qs-0.8.5
                                rust-serde-repr-0.1.20
                                rust-serde-urlencoded-0.7.1
                                rust-serde-with-1.14.0
                                rust-serde-with-3.15.0
                                rust-serde-with-macros-1.5.2
                                rust-serde-with-macros-3.15.0
                                rust-serde-yaml-0.9.34+deprecated
                                rust-serial-test-3.2.0
                                rust-serial-test-derive-3.2.0
                                rust-sha-1-0.9.8
                                rust-sha1-0.10.6
                                rust-sha1-smol-1.0.1
                                rust-sha1collisiondetection-0.3.4
                                rust-sha2-0.9.9
                                rust-sha2-0.10.9
                                rust-sha2-const-stable-0.1.0
                                rust-sha3-0.10.8
                                rust-sharded-slab-0.1.7
                                rust-shellexpand-3.1.1
                                rust-shlex-1.3.0
                                rust-sieve-rs-0.7.0
                                rust-signal-hook-registry-1.4.6
                                rust-signatory-0.27.1
                                rust-signature-2.2.0
                                rust-simd-adler32-0.3.7
                                rust-simdutf8-0.1.5
                                rust-siphasher-1.0.1
                                rust-slab-0.4.11
                                rust-smallvec-1.15.1
                                rust-smtp-proto-0.2.0
                                rust-snafu-0.7.5
                                rust-snafu-derive-0.7.5
                                rust-socket2-0.5.10
                                rust-socket2-0.6.1
                                rust-spin-0.9.8
                                rust-spin-0.10.0
                                rust-spki-0.7.3
                                rust-stabby-36.2.2
                                rust-stabby-abi-36.2.2
                                rust-stabby-macros-36.2.2
                                rust-stable-deref-trait-1.2.1
                                rust-static-assertions-1.1.0
                                rust-string-cache-0.8.9
                                rust-stringprep-0.1.5
                                rust-strsim-0.10.0
                                rust-strsim-0.11.1
                                rust-subtle-2.6.1
                                rust-syn-1.0.109
                                rust-syn-2.0.107
                                rust-sync-wrapper-0.1.2
                                rust-sync-wrapper-1.0.2
                                rust-synstructure-0.13.2
                                rust-system-configuration-0.5.1
                                rust-system-configuration-sys-0.5.0
                                rust-tagptr-0.2.0
                                rust-tap-1.0.1
                                rust-term-0.7.0
                                rust-termcolor-1.4.1
                                rust-thiserror-1.0.69
                                rust-thiserror-2.0.17
                                rust-thiserror-impl-1.0.69
                                rust-thiserror-impl-2.0.17
                                rust-thread-local-1.1.9
                                rust-time-0.3.44
                                rust-time-core-0.1.6
                                rust-time-macros-0.2.24
                                rust-tiny-keccak-2.0.2
                                rust-tinystr-0.8.1
                                rust-tinyvec-1.10.0
                                rust-tinyvec-macros-0.1.1
                                rust-tls-listener-0.11.0
                                rust-token-cell-2.0.0
                                rust-tokio-1.48.0
                                rust-tokio-macros-2.6.0
                                rust-tokio-postgres-0.7.15
                                rust-tokio-rustls-0.24.1
                                rust-tokio-rustls-0.26.4
                                rust-tokio-stream-0.1.17
                                rust-tokio-tungstenite-0.28.0
                                rust-tokio-util-0.7.16
                                rust-tokio-websockets-0.10.1
                                rust-toml-datetime-0.7.3
                                rust-toml-edit-0.23.7
                                rust-toml-parser-1.0.4
                                rust-tonic-0.12.3
                                rust-totp-rs-5.7.0
                                rust-tower-0.4.13
                                rust-tower-0.5.2
                                rust-tower-http-0.6.6
                                rust-tower-layer-0.3.3
                                rust-tower-service-0.3.3
                                rust-tracing-0.1.41
                                rust-tracing-attributes-0.1.30
                                rust-tracing-core-0.1.34
                                rust-tracing-log-0.2.0
                                rust-tracing-serde-0.2.0
                                rust-tracing-subscriber-0.3.20
                                rust-try-lock-0.2.5
                                rust-try-map-0.3.1
                                rust-tryhard-0.5.2
                                rust-tungstenite-0.28.0
                                rust-twofish-0.7.1
                                rust-twox-hash-2.1.2
                                rust-typenum-1.19.0
                                rust-typewit-1.14.2
                                rust-typewit-proc-macros-1.8.1
                                rust-ucd-trie-0.1.7
                                rust-uhlc-0.8.2
                                rust-unicase-2.8.1
                                rust-unicode-bidi-0.3.18
                                rust-unicode-ident-1.0.20
                                rust-unicode-normalization-0.1.24
                                rust-unicode-properties-0.1.3
                                rust-unicode-script-0.5.7
                                rust-unicode-security-0.1.2
                                rust-unicode-width-0.1.14
                                rust-unicode-width-0.2.2
                                rust-unicode-xid-0.2.6
                                rust-universal-hash-0.5.1
                                rust-unsafe-libyaml-0.2.11
                                rust-untrusted-0.9.0
                                rust-unty-0.0.4
                                rust-unzip-n-0.1.2
                                rust-url-2.5.7
                                rust-urlencoding-2.1.3
                                rust-utf-8-0.7.6
                                rust-utf8-iter-1.0.4
                                rust-utf8parse-0.2.2
                                rust-uuid-1.18.1
                                rust-validated-struct-2.2.0
                                rust-validated-struct-macros-2.2.0
                                rust-valuable-0.1.1
                                rust-vcpkg-0.2.15
                                rust-vec-map-0.8.2
                                rust-version-check-0.9.5
                                rust-virtue-0.0.18
                                rust-void-1.0.2
                                rust-waker-fn-1.2.0
                                rust-walkdir-2.5.0
                                rust-want-0.3.1
                                rust-wasi-0.9.0+wasi-snapshot-preview1
                                rust-wasi-0.11.1+wasi-snapshot-preview1
                                rust-wasip2-1.0.1+wasi-0.2.4
                                rust-wasite-0.1.0
                                rust-wasm-bindgen-0.2.104
                                rust-wasm-bindgen-backend-0.2.104
                                rust-wasm-bindgen-futures-0.4.54
                                rust-wasm-bindgen-macro-0.2.104
                                rust-wasm-bindgen-macro-support-0.2.104
                                rust-wasm-bindgen-shared-0.2.104
                                rust-wasm-streams-0.4.2
                                rust-web-sys-0.3.81
                                rust-web-time-1.1.0
                                rust-webpki-root-certs-1.0.3
                                rust-webpki-roots-0.25.4
                                rust-webpki-roots-0.26.11
                                rust-webpki-roots-1.0.3
                                rust-whatlang-0.18.0
                                rust-whoami-1.6.1
                                rust-widestring-1.2.1
                                rust-winapi-0.3.9
                                rust-winapi-i686-pc-windows-gnu-0.4.0
                                rust-winapi-util-0.1.11
                                rust-winapi-x86-64-pc-windows-gnu-0.4.0
                                rust-windows-core-0.62.2
                                rust-windows-implement-0.60.2
                                rust-windows-interface-0.59.3
                                rust-windows-link-0.1.3
                                rust-windows-link-0.2.1
                                rust-windows-result-0.4.1
                                rust-windows-strings-0.5.1
                                rust-windows-sys-0.45.0
                                rust-windows-sys-0.48.0
                                rust-windows-sys-0.52.0
                                rust-windows-sys-0.59.0
                                rust-windows-sys-0.60.2
                                rust-windows-sys-0.61.2
                                rust-windows-targets-0.42.2
                                rust-windows-targets-0.48.5
                                rust-windows-targets-0.52.6
                                rust-windows-targets-0.53.5
                                rust-windows-aarch64-gnullvm-0.42.2
                                rust-windows-aarch64-gnullvm-0.48.5
                                rust-windows-aarch64-gnullvm-0.52.6
                                rust-windows-aarch64-gnullvm-0.53.1
                                rust-windows-aarch64-msvc-0.42.2
                                rust-windows-aarch64-msvc-0.48.5
                                rust-windows-aarch64-msvc-0.52.6
                                rust-windows-aarch64-msvc-0.53.1
                                rust-windows-i686-gnu-0.42.2
                                rust-windows-i686-gnu-0.48.5
                                rust-windows-i686-gnu-0.52.6
                                rust-windows-i686-gnu-0.53.1
                                rust-windows-i686-gnullvm-0.52.6
                                rust-windows-i686-gnullvm-0.53.1
                                rust-windows-i686-msvc-0.42.2
                                rust-windows-i686-msvc-0.48.5
                                rust-windows-i686-msvc-0.52.6
                                rust-windows-i686-msvc-0.53.1
                                rust-windows-x86-64-gnu-0.42.2
                                rust-windows-x86-64-gnu-0.48.5
                                rust-windows-x86-64-gnu-0.52.6
                                rust-windows-x86-64-gnu-0.53.1
                                rust-windows-x86-64-gnullvm-0.42.2
                                rust-windows-x86-64-gnullvm-0.48.5
                                rust-windows-x86-64-gnullvm-0.52.6
                                rust-windows-x86-64-gnullvm-0.53.1
                                rust-windows-x86-64-msvc-0.42.2
                                rust-windows-x86-64-msvc-0.48.5
                                rust-windows-x86-64-msvc-0.52.6
                                rust-windows-x86-64-msvc-0.53.1
                                rust-winnow-0.7.13
                                rust-winreg-0.50.0
                                rust-wit-bindgen-0.46.0
                                rust-writeable-0.6.1
                                rust-wyz-0.5.1
                                rust-x25519-dalek-2.0.1
                                rust-x509-parser-0.18.0
                                rust-xml-rs-0.8.27
                                rust-xxhash-rust-0.8.15
                                rust-yasna-0.5.2
                                rust-yoke-0.8.0
                                rust-yoke-derive-0.8.0
                                rust-zenoh-1.6.2
                                rust-zenoh-buffers-1.6.2
                                rust-zenoh-codec-1.6.2
                                rust-zenoh-collections-1.6.2
                                rust-zenoh-config-1.6.2
                                rust-zenoh-core-1.6.2
                                rust-zenoh-crypto-1.6.2
                                rust-zenoh-keyexpr-1.6.2
                                rust-zenoh-link-1.6.2
                                rust-zenoh-link-commons-1.6.2
                                rust-zenoh-link-quic-1.6.2
                                rust-zenoh-link-tcp-1.6.2
                                rust-zenoh-link-tls-1.6.2
                                rust-zenoh-link-udp-1.6.2
                                rust-zenoh-macros-1.6.2
                                rust-zenoh-plugin-trait-1.6.2
                                rust-zenoh-protocol-1.6.2
                                rust-zenoh-result-1.6.2
                                rust-zenoh-runtime-1.6.2
                                rust-zenoh-sync-1.6.2
                                rust-zenoh-task-1.6.2
                                rust-zenoh-transport-1.6.2
                                rust-zenoh-util-1.6.2
                                rust-zerocopy-0.8.27
                                rust-zerocopy-derive-0.8.27
                                rust-zerofrom-0.1.6
                                rust-zerofrom-derive-0.1.6
                                rust-zeroize-1.8.2
                                rust-zeroize-derive-1.4.2
                                rust-zerotrie-0.2.2
                                rust-zerovec-0.11.4
                                rust-zerovec-derive-0.11.1
                                rust-zip-5.1.1
                                rust-zip-6.0.0
                                rust-zlib-rs-0.5.2
                                rust-zopfli-0.8.2
                                rust-zstd-0.13.3
                                rust-zstd-safe-7.2.4
                                rust-zstd-sys-2.0.16+zstd.1.5.7)))
