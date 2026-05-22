.class public Le22/c55/s88/g/y;
.super Landroid/widget/LinearLayout;


# instance fields
.field private a:Le22/c55/s88/g/z;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/AdapterView$OnItemClickListener;Le22/c55/s88/e/j;Ljava/util/List;Le22/c55/s88/g/s;)V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, -0x1

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput-object v0, p0, Le22/c55/s88/g/y;->a:Le22/c55/s88/g/z;

    invoke-virtual {p0, v2}, Le22/c55/s88/g/y;->setBackgroundColor(I)V

    invoke-virtual {p0, v3}, Le22/c55/s88/g/y;->setOrientation(I)V

    invoke-static {p1, p3}, Le22/c55/s88/g/y;->a(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/4 v1, -0x2

    invoke-virtual {p0, v0, v2, v1}, Le22/c55/s88/g/y;->addView(Landroid/view/View;II)V

    new-instance v0, Le22/c55/s88/g/z;

    invoke-direct {v0, p1, p5}, Le22/c55/s88/g/z;-><init>(Landroid/content/Context;Le22/c55/s88/g/s;)V

    iput-object v0, p0, Le22/c55/s88/g/y;->a:Le22/c55/s88/g/z;

    new-instance v0, Le22/c55/s88/a/d;

    iget-object v1, p0, Le22/c55/s88/g/y;->a:Le22/c55/s88/g/z;

    invoke-direct {v0, p1, p4, v1}, Le22/c55/s88/a/d;-><init>(Landroid/content/Context;Ljava/util/List;Landroid/widget/ListView;)V

    iget-object v1, p0, Le22/c55/s88/g/y;->a:Le22/c55/s88/g/z;

    invoke-virtual {v1}, Le22/c55/s88/g/z;->a()V

    iget-object v1, p0, Le22/c55/s88/g/y;->a:Le22/c55/s88/g/z;

    invoke-virtual {v1, v3}, Le22/c55/s88/g/z;->setFooterDividersEnabled(Z)V

    iget-object v1, p0, Le22/c55/s88/g/y;->a:Le22/c55/s88/g/z;

    invoke-virtual {v1, v0}, Le22/c55/s88/g/z;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Le22/c55/s88/g/y;->a:Le22/c55/s88/g/z;

    invoke-virtual {p0, v1, v0}, Le22/c55/s88/g/y;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le22/c55/s88/g/y;->a:Le22/c55/s88/g/z;

    invoke-virtual {v0, p2}, Le22/c55/s88/g/z;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method public static a(Landroid/content/Context;Le22/c55/s88/e/j;)Landroid/widget/FrameLayout;
    .locals 8

    const/4 v6, 0x4

    const/4 v7, -0x2

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const v1, -0xdf7ff8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Le22/c55/s88/f/e;->h:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Le22/c55/s88/e/j;->h:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Le22/c55/s88/f/e;->w:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Le22/c55/s88/f/i;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_0

    const/16 v3, 0x140

    invoke-virtual {v2, v3}, Landroid/graphics/Bitmap;->setDensity(I)V

    invoke-static {p0, v2}, Le22/c55/s88/f/i;->a(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x10

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-static {p0, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p0, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v2, p1, Le22/c55/s88/e/j;->m:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v2, 0x41900000    # 18.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0x11

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/4 v3, 0x5

    invoke-static {p0, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/y;->a:Le22/c55/s88/g/z;

    invoke-virtual {v0}, Le22/c55/s88/g/z;->d()V

    iget-object v0, p0, Le22/c55/s88/g/y;->a:Le22/c55/s88/g/z;

    invoke-virtual {v0}, Le22/c55/s88/g/z;->c()V

    return-void
.end method

.method public b()V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/y;->a:Le22/c55/s88/g/z;

    invoke-virtual {v0}, Le22/c55/s88/g/z;->c()V

    return-void
.end method
