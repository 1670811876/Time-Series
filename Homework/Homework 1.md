<p align="center">时间序列作业1</p>
<center>朱强强</center>
<center>17064001</center>
<center>应用统计1701</center>
1. （调和平均序列）设$a,b$是常数，随机变量$U$在$(-\pi,\pi)$内均匀分布，则$X_t=b\cos(at+U),t\in T$是平稳序列。

   数学期望
   $$
   \begin{align}
   E(X_t)&=bE[\cos(at+U)]\\
   &=b\int_{-\pi}^{\pi}\dfrac{1}{2\pi}\cos(at+U)dU\\
   &=\dfrac{b}{2\pi}\cdot\sin(at+U)\Big|_{-\pi}^{\pi}\\
   &=\dfrac{b}{2\pi}\left[\sin(\pi+at)-\sin(-\pi+at)\right]\\
   &=0\\
   \end{align}
   $$
   协方差
   $$
   \begin{align}
   Cov(X_t,X_s)&=b^{2}E\left[\cos(as+U)\cos(at+U)\right]-E(X_t)\cdot E(X_s)\\
   &=b^2 E\left\{\left[\cos \left(at+as+2U\right)+\cos \left(at-as\right)\right] / 2\right\} -0\\ 
   &=b^2 \cdot\left[\int_{-\pi}^{\pi} \frac{\cos \left(at+as+2U\right)}{2} \cdot \frac{1}{2 \pi} dU+\frac{\cos \left(at-as\right)}{2}\right]\\
   &=\dfrac{b^2}{2}\cos a(t-s)
   \end{align}
   $$
   由于$X_t$的数学期望为常数0，其协方差仅与时间的差值有关，所以$X_t$为平稳序列。
   
   

2. 设$a,b$是常数，随机变量$U_1,U_2,\cdots$独立同分布且都在$(0,2\pi)$上均匀分布，证明：$X_t=b\cos(at+U_t),t\in T$是独立的$WN(0,\dfrac{b^2}{2})$。

   数学期望
   $$
   \begin{align}
   E(X_t)&=bE[\cos(at+U_t)]\\
   &=b\int_{0}^{2\pi}\dfrac{1}{2\pi}\cos(at+U_t)dU_t\\
   &=\dfrac{b}{2\pi}\cdot\sin(at+U_t)\Big|_{0}^{2\pi}\\
   &=\dfrac{b}{2\pi}\left[\sin(2\pi+at)-\sin(at)\right]\\
   &=0\\
   \end{align}
   $$
   自相关函数
   $$
   \begin{align}
   R(X_t,X_s)&=b^{2}E\left[\cos(as+U_t)\cos(at+U_t)\right]\\
   &=b^2 E\left\{\left[\cos \left(at+as+2U_t\right)+\cos \left(at-as\right)\right] / 2\right\} \\ 
   &=b^2 \cdot\left[\int_{0}^{2\pi} \frac{\cos \left(at+as+2U_t\right)}{2} \cdot \frac{1}{2 \pi} d U_t+\frac{\cos \left(at-as\right)}{2}\right]\\
   &=\dfrac{b^2}{2}\cos a(t-s)
   \end{align}
   $$
   
   
3. 考察如下四个模型平稳性。

   对1阶自回归模型AR(1)
   $$
   X_t=\varphi X_{t-1}+\varepsilon_t\\
   E(X_t^2)=\varphi^2E(X_{t-1}^2)+E(\varepsilon_t^2)+2E(X_{t-1}\varepsilon_t)
   $$
   由于$X_t$仅与$\varepsilon_t$相关，$\therefore E(X_{t-1}\varepsilon_t)=0$。如果该模型稳定，则有$E(X_t^2)=E(X_{t-1}^2)$，$\therefore$
   $$
   \gamma_0=\sigma_X^2=\dfrac{\sigma_{\varepsilon}^2}{1-\varphi^2}
   $$
   在平稳条件下，该方差是一非负的常数，从而$|\varphi|<1$。

   对AR(2)模型
   $$
   X_t=\varphi_1X_{t-1}+\varphi_2X_{t-2}+\varepsilon_t\\
   E(X_t^2)=\varphi_1E(X_tX_{t-1})+\varphi_2E(X_tX_{t-2})+E(X_t\varepsilon_t)
   $$
   即
   $$
   \gamma_0=\varphi_1\gamma_1+\varphi_2\gamma_2+E(X_t\varepsilon_t)
   $$
   又由于
   $$
   E(X_t\varepsilon_t)=\varphi_1E(X_{t-1}\varepsilon_t)+\varphi_2E(X_{t-2}\varepsilon_t)+E(\varepsilon^2)=\sigma_{\varepsilon}^2\\
   \gamma_0=\varphi_1\gamma_1+\varphi_2\gamma_2+\sigma_{\varepsilon}^2
   $$
   同理
   $$
   \gamma_1=\varphi_1\gamma_0+\varphi_2\gamma_1\\
   \gamma_2=\varphi_1\gamma_1+\varphi_2\gamma_0
   $$
   $\therefore$
   $$
   \gamma_0=\dfrac{(1-\varphi_2)\sigma_{\varepsilon}^2}{(1+\varphi_2)(1-\varphi_1-\varphi_2)(1+\varphi_1-\varphi_2)}
   $$
   由平稳性的定义，该方差必须是正数，即
   $$
   \varphi_1+\varphi_2<1,\varphi_2-\varphi_1<1,|\varphi_2|<1
   $$
   （1）$x_t=0.8x_{t-1}+\varepsilon_t$

   ​	因为0.8<1，所以该模型是平稳的。

   （2）$x_t=-1.1x_{t-1}+\varepsilon_t$

   ​	因为|-1.1|>1，所以该模型不是平稳的。

   （3）$x_t=x_{t-1}-0.5x_{t-2}+\varepsilon_t$

   ​	因为$\varphi_1+\varphi_2=0.5<1,\varphi_2-\varphi_1=-1.5<1,|\varphi_2|=0.5<1$，所以该模型是平稳的。

   （4）$x_t=x_{t-1}+0.5x_{t-2}+\varepsilon_t$

   ​	因为$\varphi_1+\varphi_2=1.5>1$，所以该模型不是平稳的。



4. 已知AR(2)模型为$(1-0.5B)(1-0.3B)X_t=\varepsilon_{t},\varepsilon_t\sim WN(0,\sigma_{\varepsilon}^2)$，请回答以下问题：(1)期望$E(X_t)$；(2)方差$Var(X_t)$；(3)自相关函数$\rho_k,k=1,2,3$
   $$
   \begin{align}
   (1-0.5B)(1-0.3B)X_t
   =(1-0.8B+0.15B^2)
   =\varepsilon_{t}
   \end{align}
   $$
   $\therefore\varphi_1=0.8,\varphi_2=-0.15$

   $\therefore X_t=0.8X_{t-1}-0.15X_{t-2}+\varepsilon_t$

   因为$\varphi_1+\varphi_2=0.65<1,\varphi_2-\varphi_1=-0.95<1,|\varphi_2|=0.15<1$，所以该模型是平稳的。

   $E(X_t)=0.8E(X_{t-1})-0.15E(X_{t-2})$

   因为该模型是平稳的，所以$E(X_t)=E(X_{t-1})=E(X_{t-2})$。

   $E(X_t)=0$

   $Var(X_t)=E(X_t^2)\gamma_0=\dfrac{(1-\varphi_2)\sigma_{\varepsilon}^2}{(1+\varphi_2)(1-\varphi_1-\varphi_2)(1+\varphi_1-\varphi_2)}=1.98\sigma_{\varepsilon}^2$

   $\rho_1=\dfrac{\varphi_1}{1-\varphi_2}=0.70$

   $\rho_2=\varphi_1\rho_1+\varphi_2=0.41$

   $\rho_3=\varphi_1\rho_2+\varphi_2\rho_1=0.223$



5. 考虑美国从1947年第1季度到2011年第3季度的季度实际GNP，该数据存放于丈件 g-GNPC96.txt中，数据已做了季节调整，以2005年GNP为基础进行了通胀调整，以10亿美元为单位（billions of chained 2005 dollars）。假设$x_t$代表GNP增长率的时间序列数据。

   (a)通过ar，应用AIC准则，可以为$x_t$识别一个AR(4)模型。拟合这个模型，拟合的模型充分吗？为什么？

   <img src="C:\Users\PC\Pictures\Learning\Time Series\coefficient1.png" alt="coefficient1" style="zoom:67%;" />

   $x_t=0.0078+0.3369x_{t-1}+0.1513x_{t-2}-0.1010x_{t-3}-0.0887_{t-4}+a_t$

   <img src="C:\Users\PC\Pictures\Learning\Time Series\test1.png" alt="test1" style="zoom:67%;" />
   
   残差序列服从自由度为20的卡方分布，$p-value=0.7632>0.05$，说明模型很不充分。
   
   (b)数据$x_t$的样本PACF识别的是AR(3)时间序列模型，拟合这个模型，拟合这个模型，拟合的模型充分吗？为什么？
   
   <img src="C:\Users\PC\Pictures\Learning\Time Series\coefficient2.png" alt="coefficient2" style="zoom:67%;" />
   
   $x_t=0.0078+0.3485x_{t-1}+0.1386x_{t-2}-0.1317x_{t-3}+a_t$
   
   <img src="C:\Users\PC\Pictures\Learning\Time Series\test2.png" alt="test2" style="zoom:67%;" />
   
   残差序列服从自由度为20的卡方分布，$p-value=0.5482>0.05$，说明模型很不充分。



6. 已知$X_t=a_t-0.7a_{t-1}+0.4a_{t-2}$，求$\rho_k$。

   当$t>s$时，$E(a_tX_s)=0$。

* 当$k=0$时，$E(X_tX_{t-k})=\gamma_k=E(X_kX_{t})=\gamma_0$。
  $$
  \begin{align}
  E(X_tX_{t})&=E[(a_t-0.7a_{t-1}+0.4a_{t-2})(a_t-0.7a_{t-1}+0.4a_{t-2})]\\
  &=E(a_t^2+0.49a_{t-1}^2+0.16a_{t-2}^2)\\
  &=1.65\sigma_a^2
  \end{align}
  $$
  $\rho_k=\dfrac{\gamma_k}{\gamma_0}=1$

* 当$k=1$时，$E(X_tX_{t-1})=\gamma_1$。
  $$
  \begin{align}
  E(X_tX_{t-1})&=E[(a_t-0.7a_{t-1}+0.4a_{t-2})X_{t-1}]\\
  &=E[(-0.7a_{t-1}+0.4a_{t-2})(a_{t-1}-0.7a_{t-2}+0.4a_{t-3})]\\
  &=-0.7\sigma_a^2-0.28\sigma_a^2\\
  &=-0.98\sigma_a^2
  \end{align}
  $$
  $\rho_k=\rho_1=\dfrac{\gamma_1}{\gamma_0}=-\dfrac{0.98}{1.65}=0.594$

* 当$k=2$时，$E(X_tX_{t-2})=\gamma_2$。
  $$
  \begin{align}
  E(X_tX_{t-2})&=E[(a_t-0.7a_{t-1}+0.4a_{t-2})X_{t-2}]\\
  &=E[0.4a_{t-2}(a_{t-2}-0.7a_{t-3}+0.4_{t-4})]\\
  &=0.4\sigma_a^2
  \end{align}
  $$
  $\rho_k=\rho_2=\dfrac{\gamma_2}{\gamma_0}=\dfrac{0.4}{1.65}=0.242$

* 当$k>2$时，$E(X_t)E_{t-k}=\gamma_k$。
  $$
  \begin{align}
  E(X_tX_{t-k})&=E[(a_t-0.7a_{t-1}+0.4a_{t-2})X_{t-k}]\\
  &=0
  \end{align}
  $$
  $\rho_k=\dfrac{\gamma_k}{\gamma_0}=0$

  综上
  $$
  \begin{cases}
  \rho_k=1 & k=1\\
  \rho_k=0.594 & k=1\\
  \rho_k=0.242 & k=2\\
  \rho_k=0 & k>2
  \end{cases}
  $$
  

